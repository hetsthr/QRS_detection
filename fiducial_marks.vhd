----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:58:33 05/28/2020 
-- Design Name: 
-- Module Name:    fiducial_marks - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fiducial_marks is
	port(	ecg_in: in std_logic_vector(7 downto 0);
			clk,reset: in std_logic;
--			block_done: out std_logic;
			data_out: out std_logic_vector(19 downto 0)
			);
end fiducial_marks;

architecture Behavioral of fiducial_marks is
	component reg_20_bit
		port(	data_in: in std_logic_vector(19 downto 0);
				clk,reset,w_en: in std_logic;
				data_out: out std_logic_vector(19 downto 0)
				);
	end component;
	component signed_comparator
		port(	a,b: in  STD_LOGIC_VECTOR(7 downto 0);
				z: out  STD_LOGIC
				);
	end component;
	component reg_8_comp
		port(	data_in: in std_logic_vector(7 downto 0);
				clk,clr,w_en: in std_logic;
				data_out: out std_logic_vector(7 downto 0)
				);
	end component;
	component counter_72
		port(	clk,clr: in std_logic;
				done: out std_logic;
				count: out std_logic_vector(9 downto 0)
				);
	end component;
	component counter_3600
	port(	clk,clr: in std_logic;
			count: out std_logic_vector(11 downto 0)
			);
	end component;
	component counter_50
		port(	clk,clr,add_en: in std_logic;
				count: out std_logic_vector(6 downto 0)
				);
	end component;
	type rr_storage is array(0 to 49) of std_logic_vector(19 downto 0);
	signal rr_peak: rr_storage := (others => (others => '0'));
	signal inv_clk_fi,done_72,gt_en_fi,reset_max_fi: std_logic;
	signal count_72: std_logic_vector(9 downto 0);
	signal count_50: std_logic_vector(6 downto 0);
	signal count_3600: std_logic_vector(11 downto 0);
	signal max_val_fi: std_logic_vector(7 downto 0);
	signal to_mem_fi: std_logic_vector(19 downto 0);
begin
	reset_max_fi <= not(reset or (count_72(3) and count_72(6)));
	inv_clk_fi <= not clk;
	counter72: counter_72 port map(clk,reset,done_72,count_72);
	counter50: counter_50 port map(inv_clk_fi,reset,done_72,count_50);
	counter3600: counter_3600 port map(clk,reset,count_3600);
	comparator1: signed_comparator port map(ecg_in,max_val_fi,gt_en_fi);
--	store1: reg_8_sync port map(ecg_in,inv_clk_fi,reset_max_fi,gt_en_fi,max_val_fi);
	store1: reg_8_comp port map(ecg_in,inv_clk_fi,reset_max_fi,gt_en_fi,max_val_fi);
	store2: reg_20_bit port map(("00000000" & count_3600),inv_clk_fi,reset,gt_en_fi,to_mem_fi);
	rr_peak(to_integer(unsigned(count_50))) <= max_val_fi & to_mem_fi(11 downto 0);
	data_out <= max_val_fi & to_mem_fi(11 downto 0);
end Behavioral;

