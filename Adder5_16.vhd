----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:12:43 05/26/2020 
-- Design Name: 
-- Module Name:    Adder5_16 - Behavioral 
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

entity Adder5_16 is
port(a,b,c,d: in std_logic_vector(15 downto 0); Sum:out std_logic_vector(15 downto 0); Carry:out std_logic); 
end Adder5_16;

architecture Behavioral of Adder5_16 is
component Adder_16
	port(A,B:in std_logic_vector(15 downto 0); Cin:in std_logic; Sum:out std_logic_vector(15 downto 0); carry:out std_logic); 
end component;
component Adder_1
	port(A,B,Cin:in std_logic; Sum,Carry:out std_logic); 
end component;
type arr is array (2 downto 0) of std_logic_vector(15 downto 0);
signal cx: std_logic_vector(3 downto 0);
signal s: arr;
begin

	ADD1: Adder_16 port map (a,b,'0',s(0),cx(0));
	ADD2: Adder_16 port map (s(0),c,'0',s(1),cx(1));
	ADD3: Adder_16 port map (s(1),d,'0',Sum,cx(2));
	ADD5: Adder_1 port map (cx(0),cx(1),cx(2),Carry,cx(3));

end Behavioral;

