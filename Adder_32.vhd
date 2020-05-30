----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:59:04 05/19/2020 
-- Design Name: 
-- Module Name:    Adder_32 - Behavioral 
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

entity Adder_32 is
port(A,B:in std_logic_vector(31 downto 0); Cin:in std_logic; Sum:out std_logic_vector(31 downto 0); carry:out std_logic); 
end Adder_32;

architecture Behavioral of Adder_32 is
component Adder_16
	port(A,B:in std_logic_vector(15 downto 0); Cin:in std_logic; Sum:out std_logic_vector(15 downto 0); carry:out std_logic); 
end component;
signal Cx:std_logic;
begin
	ADD1_16: Adder_16 port map(A(15 downto 0),B(15 downto 0),Cin,Sum(15 downto 0),Cx);
	ADD2_16: Adder_16 port map(A(31 downto 16),B(31 downto 16),Cx,Sum(31 downto 16),Carry);

end Behavioral;

