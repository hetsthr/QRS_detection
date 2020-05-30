----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:05:56 05/15/2020 
-- Design Name: 
-- Module Name:    Adder_16 - Behavioral 
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

entity Adder_16 is
	port(	A,B:in std_logic_vector(15 downto 0); 
			Cin:in std_logic; 
			Sum:out std_logic_vector(15 downto 0); 
			carry:out std_logic
			); 
end Adder_16;

architecture Behavioral of Adder_16 is
component Adder_8
	port(A,B:in std_logic_vector(7 downto 0); Cin:in std_logic; Sum:out std_logic_vector(7 downto 0); carry:out std_logic); 
end component;
signal Cx:std_logic;
begin

	ADD1: Adder_8 port map(A(7 downto 0),B(7 downto 0),Cin,Sum(7 downto 0),Cx);
	ADD2: Adder_8 port map(A(15 downto 8),B(15 downto 8),Cx,Sum(15 downto 8),Carry);

end Behavioral;

