----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:57:49 05/15/2020 
-- Design Name: 
-- Module Name:    Adder_6 - Behavioral 
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

entity Adder_6 is
port(A,B:in std_logic_vector(5 downto 0); Cin:in std_logic; Sum:out std_logic_vector(5 downto 0); carry:out std_logic); 
end Adder_6;

architecture Behavioral of Adder_6 is
component Adder_2
	port(A,B:in std_logic_vector(1 downto 0); Cin:in std_logic; Sum:out std_logic_vector(1 downto 0); carry:out std_logic); 
end component;
component Adder_4
	port(A,B:in std_logic_vector(3 downto 0); Cin:in std_logic; Sum:out std_logic_vector(3 downto 0); carry:out std_logic);
end component;
signal Cx:std_logic;
begin

	ADD1: Adder_2 port map(A(1 downto 0),B(1 downto 0),Cin,Sum(1 downto 0),Cx);
	ADD2: Adder_4 port map(A(5 downto 2),B(5 downto 2),Cx,Sum(5 downto 2),carry);

end Behavioral;

