----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:29:17 05/30/2020 
-- Design Name: 
-- Module Name:    max - Behavioral 
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

entity max is
port(a,b:in std_logic_vector(7 downto 0); z:out std_logic_vector(7 downto 0));
end max;

architecture Behavioral of max is
component signed_comparator
	port(	a,b: in std_logic_vector(7 downto 0);
			z: out std_logic
			);
end component;
component and_1
	port(x,y:in std_logic; z:out std_logic);
end component;
component not_1
	port(x:in std_logic; y:out std_logic);
end component;
component or_1
	port(x,y:in std_logic; z:out std_logic);
end component;
signal x1,y1:std_logic_vector(7 downto 0);
signal c,c_c: std_logic;
begin

	CMP1: signed_comparator port map(a,b,c);
	N1: not_1 port map(c,c_c);
	
	A11: and_1 port map(a(0),c,x1(0));
	A12: and_1 port map(a(1),c,x1(1));
	A13: and_1 port map(a(2),c,x1(2));
	A14: and_1 port map(a(3),c,x1(3));
	A15: and_1 port map(a(4),c,x1(4));
	A16: and_1 port map(a(5),c,x1(5));
	A17: and_1 port map(a(6),c,x1(6));
	A18: and_1 port map(a(7),c,x1(7));

	A21: and_1 port map(b(0),c_c,y1(0));
	A22: and_1 port map(b(1),c_c,y1(1));
	A23: and_1 port map(b(2),c_c,y1(2));
	A24: and_1 port map(b(3),c_c,y1(3));
	A25: and_1 port map(b(4),c_c,y1(4));
	A26: and_1 port map(b(5),c_c,y1(5));
	A27: and_1 port map(b(6),c_c,y1(6));
	A28: and_1 port map(b(7),c_c,y1(7));

	O1: or_1 port map(x1(0),y1(0),z(0));
	O2: or_1 port map(x1(1),y1(1),z(1));
	O3: or_1 port map(x1(2),y1(2),z(2));
	O4: or_1 port map(x1(3),y1(3),z(3));
	O5: or_1 port map(x1(4),y1(4),z(4));
	O6: or_1 port map(x1(5),y1(5),z(5));
	O7: or_1 port map(x1(6),y1(6),z(6));
	O8: or_1 port map(x1(7),y1(7),z(7));
end Behavioral;

