----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:39:59 05/24/2020 
-- Design Name: 
-- Module Name:    comparator - Behavioral 
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

entity comparator is
	Port (a: in  STD_LOGIC_VECTOR(7 downto 0);
	b : in  STD_LOGIC_VECTOR(7 downto 0);
	z: out  STD_LOGIC);
end comparator;

architecture Behavioral of comparator is
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
component or_1
	port(x,y:in std_logic; z:out std_logic);
end component;
type arr is array (0 to 15) of std_logic;
type arr1 is array (1 to 7) of std_logic;
type arr2 is array (0 to 6) of std_logic;
type arr3 is array (0 to 1) of std_logic;

signal x:arr;
signal c:arr1;
signal d:arr2;
signal v:arr3;

begin

	N7: not_1 port map(b(7),x(0));
	A7: and_1 port map(a(7),x(0),x(1));
	
	X7: xnor_1 port map(a(7),b(7),c(7));
	N6: not_1 port map(b(6),x(2));
	A6: and_3 port map(a(6),x(2),c(7),x(3));
	
	X6: xnor_1 port map(a(6),b(6),c(6));
	N5: not_1 port map(b(5),x(4));
	A5: and_4 port map(a(5),x(4),c(7),c(6),x(5));
	
	X5: xnor_1 port map(a(5),b(5),c(5));
	N4: not_1 port map(b(4),x(6));
	A44: and_4 port map(a(4),x(6),c(7),c(6),d(0));
	A42: and_1 port map(d(0),c(5),x(7));
	
	O1: or_4 port map(x(1),x(3),x(5),x(7),v(0));
	
	X4: xnor_1 port map(a(4),b(4),c(4));
	N3: not_1 port map(b(3),x(8));
	A34: and_4 port map(a(3),x(8),c(7),c(6),d(1));
	A33: and_3 port map(d(1),c(5),c(4),x(9));
	
	X3: xnor_1 port map(a(3),b(3),c(3));
	N2: not_1 port map(b(2),x(10));
	A241: and_4 port map(a(2),x(10),c(7),c(6),d(2));
	A242: and_4 port map(d(2),c(5),c(4),c(3),x(11));
		
	X2: xnor_1 port map(a(2),b(2),c(2));
	N1: not_1 port map(b(1),x(12));
	A141: and_4 port map(a(1),x(12),c(7),c(6),d(3));
	A142: and_4 port map(d(3),c(5),c(4),c(3),d(4));
	A12: and_1 port map(d(4),c(2),x(13));
	
	X1: xnor_1 port map(a(1),b(1),c(1));
	N0: not_1 port map(b(0),x(14));
	A041: and_4 port map(a(0),x(14),c(7),c(6),d(5));
	A042: and_4 port map(d(5),c(5),c(4),c(3),d(6));
	A02: and_3 port map(d(6),c(2),c(1),x(15));
	
	O2: or_4 port map(x(9),x(11),x(13),x(15),v(1));
	
	O3: or_1 port map(v(0),v(1),z);
	
end Behavioral;

