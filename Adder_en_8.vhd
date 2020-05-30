----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:46:46 05/25/2020 
-- Design Name: 
-- Module Name:    Adder_en_8 - Behavioral 
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

entity Adder_en_8 is
	port(A,B:in std_logic_vector(7 downto 0); Cin,CLK:in std_logic; Sum:out std_logic_vector(7 downto 0); Carry:out std_logic); 
end Adder_en_8;

architecture Behavioral of Adder_en_8 is
component Adder_en_4
	port(A,B:in std_logic_vector(3 downto 0); Cin,CLK:in std_logic; Sum:out std_logic_vector(3 downto 0); carry:out std_logic); 
end component;
signal Cx:std_logic;
begin
	ADD1: Adder_en_4 port map(A(3 downto 0),B(3 downto 0),Cin,CLK,Sum(3 downto 0),Cx);
	ADD2: Adder_en_4 port map(A(7 downto 4),B(7 downto 4),Cx,CLK,Sum(7 downto 4),Carry);
end Behavioral;

