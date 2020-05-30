----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:53:30 05/29/2020 
-- Design Name: 
-- Module Name:    Comparator_16 - Behavioral 
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

entity Comparator_16 is
	Port (a: in  std_logic_vector(15 downto 0);
	b : in  std_logic_vector(15 downto 0);
	z: out  std_logic);
end Comparator_16;

architecture Behavioral of Comparator_16 is
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


signal x: std_logic_vector(31 downto 0);
signal c: std_logic_vector(15 downto 1);
signal d: std_logic_vector(34 downto 0);
signal v: std_logic_vector(3 downto 0);

begin

	N15: not_1 port map(b(15),x(0));
	A15: and_1 port map(a(15),x(0),x(1));
	
	X15: xnor_1 port map(a(15),b(15),c(15));
	N14: not_1 port map(b(14),x(2));
	A14: and_3 port map(a(14),x(2),c(15),x(3));
	
	X14: xnor_1 port map(a(14),b(14),c(14));
	N13: not_1 port map(b(13),x(4));
	A13: and_4 port map(a(13),x(4),c(15),c(14),x(5));
	
	X13: xnor_1 port map(a(13),b(13),c(13));
	N12: not_1 port map(b(12),x(6));
	A12: and_4 port map(a(12),x(6),c(15),c(14),d(0));
	A122: and_1 port map(d(0),c(13),x(7));
	
	O1: or_4 port map(x(1),x(3),x(5),x(7),v(0));
	
	X12: xnor_1 port map(a(12),b(12),c(12));
	N11: not_1 port map(b(11),x(8));
	A11: and_4 port map(a(11),x(8),c(15),c(14),d(1));
	A113: and_3 port map(d(1),c(13),c(12),x(9));
	
	X11: xnor_1 port map(a(11),b(11),c(11));
	N10: not_1 port map(b(10),x(10));
	A1041: and_4 port map(a(10),x(10),c(15),c(14),d(2));
	A1042: and_4 port map(d(2),c(13),c(12),c(11),x(11));
	
	X10: xnor_1 port map(a(10),b(10),c(10));
	N9: not_1 port map(b(9),x(12));
	A941: and_4 port map(a(9),x(12),c(15),c(14),d(3));
	A942: and_4 port map(d(3),c(13),c(12),c(11),d(4));
	A92: and_1 port map(d(4),c(10),x(13));
	
	X9: xnor_1 port map(a(9),b(9),c(9));
	N8: not_1 port map(b(8),x(14));
	A841: and_4 port map(a(8),x(14),c(15),c(14),d(5));
	A842: and_4 port map(d(5),c(13),c(12),c(11),d(6));
	A83: and_3 port map(d(6),c(10),c(9),x(15));
	
	O2: or_4 port map(x(9),x(11),x(13),x(15),v(1));
	
	X8: xnor_1 port map(a(8),b(8),c(8));
	N7: not_1 port map(b(7),x(16));
	A741: and_4 port map(a(7),x(16),c(15),c(14),d(7));
	A742: and_4 port map(d(7),c(13),c(12),c(11),d(8));
	A743: and_4 port map(d(8),c(10),c(9),c(8),x(17));
	
	X7: xnor_1 port map(a(7),b(7),c(7));
	N6: not_1 port map(b(6),x(18));
	A641: and_4 port map(a(6),x(18),c(15),c(14),d(9));
	A642: and_4 port map(d(9),c(13),c(12),c(11),d(10));
	A643: and_4 port map(d(10),c(10),c(9),c(8),d(11));
	A62: and_1 port map(d(11),c(7),x(19));
	
	X6: xnor_1 port map(a(6),b(6),c(6));
	N5: not_1 port map(b(5),x(20));
	A541: and_4 port map(a(5),x(20),c(15),c(14),d(12));
	A542: and_4 port map(d(12),c(13),c(12),c(11),d(13));
	A543: and_4 port map(d(13),c(10),c(9),c(8),d(14));
	A53: and_3 port map(d(14),c(7),c(6),x(21));
	
	X5: xnor_1 port map(a(5),b(5),c(5));
	N4: not_1 port map(b(4),x(22));
	A441: and_4 port map(a(4),x(22),c(15),c(14),d(15));
	A442: and_4 port map(d(15),c(13),c(12),c(11),d(16));
	A443: and_4 port map(d(16),c(10),c(9),c(8),d(17));
	A444: and_4 port map(d(17),c(7),c(6),c(5),x(23));
	
	O3: or_4 port map(x(17),x(19),x(21),x(23),v(2));
	
	X4: xnor_1 port map(a(4),b(4),c(4));
	N3: not_1 port map(b(3),x(24));
	A341: and_4 port map(a(3),x(24),c(15),c(14),d(18));
	A342: and_4 port map(d(18),c(13),c(12),c(11),d(19));
	A343: and_4 port map(d(19),c(10),c(9),c(8),d(20));
	A344: and_4 port map(d(20),c(7),c(6),c(5),d(21));
	A32: and_1 port map(d(21),c(4),x(25)); 
	
	X3: xnor_1 port map(a(3),b(3),c(3));
	N2: not_1 port map(b(2),x(26));
	A241: and_4 port map(a(2),x(26),c(15),c(14),d(22));
	A242: and_4 port map(d(22),c(13),c(12),c(11),d(23));
	A243: and_4 port map(d(23),c(10),c(9),c(8),d(24));
	A244: and_4 port map(d(24),c(7),c(6),c(5),d(25));
	A23: and_3 port map(d(25),c(4),c(3),x(27)); 
	
	X2: xnor_1 port map(a(2),b(2),c(2));
	N1: not_1 port map(b(1),x(28));
	A141: and_4 port map(a(1),x(28),c(15),c(14),d(26));
	A142: and_4 port map(d(26),c(13),c(12),c(11),d(27));
	A143: and_4 port map(d(27),c(10),c(9),c(8),d(28));
	A144: and_4 port map(d(28),c(7),c(6),c(5),d(29));
	A145: and_4 port map(d(29),c(4),c(3),c(2),x(29)); 
	
	X1: xnor_1 port map(a(1),b(1),c(1));
	N0: not_1 port map(b(0),x(30));
	A041: and_4 port map(a(0),x(30),c(15),c(14),d(30));
	A042: and_4 port map(d(30),c(13),c(12),c(11),d(31));
	A043: and_4 port map(d(31),c(10),c(9),c(8),d(32));
	A044: and_4 port map(d(32),c(7),c(6),c(5),d(33));
	A045: and_4 port map(d(33),c(4),c(3),c(2),d(34));
	A02: and_1 port map(d(34),c(1),x(31));
	
	O4: or_4 port map(x(25),x(27),x(29),x(31),v(3));
	
	O5: or_4 port map(v(0),v(1),v(2),v(3),z);

end Behavioral;

