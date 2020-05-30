----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:02:36 05/24/2020 
-- Design Name: 
-- Module Name:    training_phase - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity training_phase is
	port(	data_in: in std_logic_vector(7 downto 0);
			clk,clr: in std_logic;
			training_complete: out std_logic;
			thr_sig,thr_noise: out std_logic_vector(7 downto 0)
			);
end training_phase;

architecture Behavioral of training_phase is
	component counter
		port(	clk,clr: in std_logic;
				done: out std_logic;
				count: out std_logic_vector (9 downto 0)
				);
	end component;
	component reg_8_bit
		port(	data_in: in std_logic_vector(7 downto 0);
				clk,clr,w_en: in std_logic;
				data_out: out std_logic_vector(7 downto 0)
				);
	end component;
	component reg_16_bit
		port(	data_in: in std_logic_vector(15 downto 0);
				clk,clr,w_en: in std_logic;
				data_out: out std_logic_vector(15 downto 0)
				);
	end component;
	component signed_comparator
		port(	a,b: in  STD_LOGIC_VECTOR(7 downto 0);
				z: out  STD_LOGIC
				);
	end component;
	component signed_multiplier
		port( a,b: in std_logic_vector(7 downto 0);
				p: out std_logic_vector (15 downto 0)
				);
	end component;
	component Adder_16
		port(	A,B:in std_logic_vector(15 downto 0); 
				Cin:in std_logic; 
				Sum:out std_logic_vector(15 downto 0); 
				carry:out std_logic
				); 
	end component;
	component mux_1 
		port(	i0,i1: in std_logic;
				s: in std_logic;
				o: out std_logic
				);
	end component;
	constant divisor1: std_logic_vector (7 downto 0):= "00010101"; -- (1/3)
	constant divisor2: std_logic_vector (7 downto 0):= "00000011"; -- (1/24)
	constant divisor3: std_logic_vector (7 downto 0):= "00000010"; -- (1/30)
	constant divisor4: std_logic_vector (7 downto 0):= "00100000"; -- (1/2)
	signal gt_en,gated_clk,inv_clk,done,sel: std_logic;
	signal max_val: std_logic_vector (7 downto 0);
	signal sample_count: std_logic_vector (9 downto 0);
	signal thr_sig_temp,div2,div3,temp_mean,add_out,noise_temp: std_logic_vector (15 downto 0);
begin
	-- Thr_Sig
	sel <= (not done) or clr;
--	mux1: mux_1 port map('0',clk,sel,gated_clk);
	gated_clk <= done or clk;
	inv_clk <= not gated_clk;
	training_complete <= done;
	counter1: counter port map(gated_clk,clr,done,sample_count);
	comparator1: signed_comparator port map(data_in,max_val,gt_en);
	store1: reg_8_bit port map(data_in,gated_clk,clr,gt_en,max_val);
	divider1: signed_multiplier port map(max_val,divisor1,thr_sig_temp);
	thr_sig <= thr_sig_temp(13 downto 6);
	-- Thr_Noise
	divider2: signed_multiplier port map(data_in,divisor2,div2);
	add1: Adder_16 port map(div2,temp_mean,'0',add_out);
	store2: reg_16_bit port map(add_out,gated_clk,clr,inv_clk,temp_mean);
	divider3: signed_multiplier port map(temp_mean(13 downto 6),divisor3,div3);
	divider4: signed_multiplier port map(div3(13 downto 6),divisor4,noise_temp);
	thr_noise <= noise_temp(13 downto 6);
end Behavioral;
