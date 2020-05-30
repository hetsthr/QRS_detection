----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:12:51 05/29/2020 
-- Design Name: 
-- Module Name:    Comparator_12 - Behavioral 
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

entity Comparator_12 is
	Port (a: in  std_logic_vector(11 downto 0);
	b : in  std_logic_vector(11 downto 0);
	z: out  std_logic);
end Comparator_12;

architecture Behavioral of Comparator_12 is
component and_1
	port(x,y:in std_logic; z:out std_logic);
end component;
component and_3
	port(a,b,c:in std_logic; z:out std_logic);
end component;
component and_4
	port(a,b,c,d:in std_logic; z:out std_logic);
end component;
component not_1
	port(x:in std_logic; y:out std_logic);
end component;
component xnor_1
	port(x,y:in std_logic; z:out std_logic);
end component;
component or_4
	port(a,b,c,d:in std_logic; z:out std_logic);
end component;
component or_3
	port(a,b,c:in std_logic; z:out std_logic);
end component;

signal x: std_logic_vector(23 downto 0);
signal c: std_logic_vector(11 downto 1);
signal d: std_logic_vector(17 downto 0);
signal v: std_logic_vector(2 downto 0);

begin

	N11: not_1 port map(b(11),x(0));
	A11: and_1 port map(a(11),x(0),x(1));
	
	X11: xnor_1 port map(a(11),b(11),c(11));
	N10: not_1 port map(b(10),x(2));
	A10: and_3 port map(a(10),x(2),c(11),x(3));
	
	X10: xnor_1 port map(a(10),b(10),c(10));
	N9: not_1 port map(b(9),x(4));
	A9: and_4 port map(a(9),x(4),c(11),c(10),x(5));
	
	X9: xnor_1 port map(a(9),b(9),c(9));
	N8: not_1 port map(b(8),x(6));
	A84: and_4 port map(a(8),x(6),c(11),c(10),d(0));
	A82: and_1 port map(d(0),c(9),x(7));
	
	O1: or_4 port map(x(1),x(3),x(5),x(7),v(0));
	
	X8: xnor_1 port map(a(8),b(8),c(8));
	N7: not_1 port map(b(7),x(8));
	A74: and_4 port map(a(7),x(8),c(11),c(10),d(1));
	A73: and_3 port map(d(1),c(9),c(8),x(9));
	
	X7: xnor_1 port map(a(7),b(7),c(7));
	N6: not_1 port map(b(6),x(10));
	A641: and_4 port map(a(6),x(10),c(11),c(10),d(2));
	A642: and_4 port map(d(2),c(9),c(8),c(7),x(11));
	
	X6: xnor_1 port map(a(6),b(6),c(6));
	N5: not_1 port map(b(5),x(12));
	A541: and_4 port map(a(5),x(12),c(11),c(10),d(3));
	A542: and_4 port map(d(3),c(9),c(8),c(7),d(4));
	A52: and_1 port map(d(4),c(6),x(13));
	
	X5: xnor_1 port map(a(5),b(5),c(5));
	N4: not_1 port map(b(4),x(14));
	A441: and_4 port map(a(4),x(14),c(11),c(10),d(5));
	A442: and_4 port map(d(5),c(9),c(8),c(7),d(6));
	A43: and_3 port map(d(6),c(6),c(5),x(15));
	
	O2: or_4 port map(x(9),x(11),x(13),x(15),v(1));
	
	X4: xnor_1 port map(a(4),b(4),c(4));
	N3: not_1 port map(b(3),x(16));
	A341: and_4 port map(a(3),x(16),c(11),c(10),d(7));
	A342: and_4 port map(d(7),c(9),c(8),c(7),d(8));
	A343: and_4 port map(d(8),c(6),c(5),c(4),x(17));
	
	X3: xnor_1 port map(a(3),b(3),c(3));
	N2: not_1 port map(b(2),x(18));
	A241: and_4 port map(a(2),x(18),c(11),c(10),d(9));
	A242: and_4 port map(d(9),c(9),c(8),c(7),d(10));
	A243: and_4 port map(d(10),c(6),c(5),c(4),d(11));
	A22: and_1 port map(d(11),c(3),x(19));
	
	X2: xnor_1 port map(a(2),b(2),c(2));
	N1: not_1 port map(b(1),x(20));
	A141: and_4 port map(a(1),x(20),c(11),c(10),d(12));
	A142: and_4 port map(d(12),c(9),c(8),c(7),d(13));
	A143: and_4 port map(d(13),c(6),c(5),c(4),d(14));
	A13: and_3 port map(d(14),c(3),c(2),x(21));
	
	X1: xnor_1 port map(a(1),b(1),c(1));
	N0: not_1 port map(b(0),x(22));
	A041: and_4 port map(a(0),x(22),c(11),c(10),d(15));
	A042: and_4 port map(d(15),c(9),c(8),c(7),d(16));
	A043: and_4 port map(d(16),c(6),c(5),c(4),d(17));
	A03: and_4 port map(d(17),c(3),c(2),c(1),x(23));
	
	O3: or_4 port map(x(17),x(19),x(21),x(23),v(2));
	
	O4: or_3 port map(v(0),v(1),v(2),z);

end Behavioral;

