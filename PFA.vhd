----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:02:10 05/14/2020 
-- Design Name: 
-- Module Name:    PFA - Behavioral 
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

entity PFA is
port(A,B,C:in std_logic; S,G,P:out std_logic);
end PFA;

architecture Behavioral of PFA is
component and_1 
	port(x,y:in std_logic; z:out std_logic);
end component;
component xor_1
	port(x,y:in std_logic; z:out std_logic);
end component;
component buffer_1
	port(x:in std_logic; y:out std_logic);
end component;
signal s1:std_logic;
begin
	XO1: xor_1 port map(A,B,s1);
	XO2: xor_1 port map(s1,C,S);
	A1: and_1 port map(A,B,G);
	BUF1: buffer_1 port map(s1,P);
end Behavioral;

