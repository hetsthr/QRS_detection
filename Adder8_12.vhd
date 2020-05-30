----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:10:37 05/28/2020 
-- Design Name: 
-- Module Name:    Adder8_12 - Behavioral 
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

entity Adder8_12 is
port(a,b,c,d,e,f,g,h: in std_logic_vector(11 downto 0); Sum:out std_logic_vector(11 downto 0); Carry:out std_logic); 
end Adder8_12;

architecture Behavioral of Adder8_12 is
component Adder_12
port(A,B:in std_logic_vector(11 downto 0); Cin:in std_logic; Sum:out std_logic_vector(11 downto 0); carry:out std_logic); 
end component;
component Adder_1
	port(A,B,Cin:in std_logic; Sum,Carry:out std_logic); 
end component;
type arr is array (5 downto 0) of std_logic_vector(11 downto 0);
signal cx: std_logic_vector(11 downto 0);
signal s: arr;
begin

	ADD1: Adder_12 port map (a,b,'0',s(0),cx(0));
	ADD2: Adder_12 port map (s(0),c,'0',s(1),cx(1));
	ADD3: Adder_12 port map (s(1),d,'0',s(2),cx(2));
	ADD4: Adder_12 port map (s(2),e,'0',s(3),cx(3));
	ADD5: Adder_12 port map (s(3),f,'0',s(4),cx(4));
	ADD6: Adder_12 port map (s(4),g,'0',s(5),cx(5));
	ADD7: Adder_12 port map (s(5),h,'0',Sum,cx(6));
	ADD8: Adder_1 port map (cx(0),cx(1),cx(2),cx(7),cx(8));
	ADD9: Adder_1 port map (cx(7),cx(3),cx(4),cx(9),cx(10));
	ADD10: Adder_1 port map (cx(9),cx(5),cx(6),Carry,cx(11));

end Behavioral;

