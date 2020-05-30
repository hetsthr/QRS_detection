----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:10:13 05/08/2020 
-- Design Name: 
-- Module Name:    filter_cell - Behavioral 
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
--use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity filter_cell is
port(	in1,in2: in std_logic_vector(7 downto 0);
		coeff: in std_logic_vector(7 downto 0);
		clk,reset: in std_logic;
		q1,q2: out std_logic_vector(7 downto 0);
		result: out std_logic_vector(15 downto 0)
		);
end filter_cell;

architecture Behavioral of filter_cell is
	signal out1,out2,sum: std_logic_vector(7 downto 0);
	signal carry: std_logic;
	component ff_8_bit
		port(	D: in std_logic_vector(7 downto 0);
				clk: in std_logic;
				Q: out std_logic_vector(7 downto 0)
				);
	end component;
	component signed_multiplier
		port(	a,b: in std_logic_vector(7 downto 0);
				p: out std_logic_vector(15 downto 0)
				);
	end component;
	component RCA_8
		port(	a,b: in std_logic_vector (7 downto 0);
				s: out std_logic_vector (7 downto 0);
				c: out std_logic
				);
	end component;
		
begin
	FF1: ff_8_bit port map(in1,clk,out1);
	FF2: ff_8_bit port map(in2,clk,out2);
	RCA8_1: RCA_8 port map (out1,out2,sum,carry);
	MUL: signed_multiplier port map(sum,coeff,result); --	result <= sum * coeff;
	q1 <= out1;
	q2 <= out2;
end Behavioral;

