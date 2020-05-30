----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:30:59 05/29/2020 
-- Design Name: 
-- Module Name:    counter_50 - Behavioral 
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

entity counter_50 is
		port(	clk,clr,add_en: in std_logic;
				count: out std_logic_vector(6 downto 0)
				);
end counter_50;

architecture Behavioral of counter_50 is
	component Adder_16
		port(	A,B:in std_logic_vector(15 downto 0); 
				Cin:in std_logic; 
				Sum:out std_logic_vector(15 downto 0); 
				carry:out std_logic
				); 
	end component;
	component sync_d_ff_r
		port(	clk,reset,D_in: in std_logic;
				q,q_b: out std_logic
				);
	end component;
	component mux_20
		port(	i0,i1: in std_logic_vector(19 downto 0);
				s: in std_logic;
				o: out std_logic_vector(19 downto 0)
				);
	end component;
	signal reset,c_out: std_logic;
	signal q,qb: std_logic_vector (6 downto 0);
	signal add_in1,add_out: std_logic_vector (15 downto 0);
	signal add_in2: std_logic_vector (19 downto 0);
	signal zero: std_logic_vector(19 downto 0) := "00000000000000000000";
	signal one: std_logic_vector(19 downto 0) := "00000000000000000001";
begin
	ff0: sync_d_ff_r port map(clk,reset,add_out(0),q(0),qb(0));
	ff1: sync_d_ff_r port map(clk,reset,add_out(1),q(1),qb(1));
	ff2: sync_d_ff_r port map(clk,reset,add_out(2),q(2),qb(2));
	ff3: sync_d_ff_r port map(clk,reset,add_out(3),q(3),qb(3));
	ff4: sync_d_ff_r port map(clk,reset,add_out(4),q(4),qb(4));
	ff5: sync_d_ff_r port map(clk,reset,add_out(5),q(5),qb(5));
	ff6: sync_d_ff_r port map(clk,reset,add_out(6),q(6),qb(6));
	M1: mux_20 port map(zero,one,add_en,add_in2);
	add_in1 <= "000000000" & q;
	adder: Adder_16 port map(add_in1,add_in2(15 downto 0),'0',add_out,c_out);
	count <= q;
	reset <= (not clr) and (not (q(5) and q(4) and q(1) and q(0)));
end Behavioral;