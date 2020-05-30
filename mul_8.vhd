----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:59:44 05/29/2020 
-- Design Name: 
-- Module Name:    mul_8 - Behavioral 
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

entity mul_8 is
port(a,b:in std_logic_vector(7 downto 0); z:out std_logic_vector(15 downto 0));
end mul_8;

architecture Behavioral of mul_8 is
component mul_4
port(a,b:in std_logic_vector(3 downto 0); z:out std_logic_vector(7 downto 0));
end component;
component Adder_8
port(A,B:in std_logic_vector(7 downto 0); Cin:in std_logic; Sum:out std_logic_vector(7 downto 0); carry:out std_logic); 
end component;
component half_adder
		port(	a,b: in std_logic;
				s,c: out std_logic
				);
end component;
component or_1
port(x,y:in std_logic; z:out std_logic);
end component;
component buffer_1 
port(x:in std_logic; y:out std_logic);
end component;
signal x: std_logic_vector(31 downto 0);
signal sum_1,sum_2: std_logic_vector(7 downto 0);
signal cx_1,cx_2,cx,cx1,cx2,cx3,cx4: std_logic;
begin

	MUL1: mul_4 port map(a(3 downto 0),b(3 downto 0),x(7 downto 0));
	MUL2: mul_4 port map(a(3 downto 0),b(7 downto 4),x(15 downto 8));
	MUL3: mul_4 port map(a(7 downto 4),b(3 downto 0),x(23 downto 16));
	MUL4: mul_4 port map(a(7 downto 4),b(7 downto 4),x(31 downto 24));
	
	ADD1: Adder_8 port map(x(23 downto 16),x(15 downto 8),'0',sum_1,cx_1);
	ADD2: Adder_8 port map(sum_1,x(27 downto  24)&x(7 downto 4),'0',sum_2,cx_2);
	
	O1: or_1 port map(cx_1,cx_2,cx);
	H1: half_adder port map(cx,x(28),z(12),cx1);
	H2: half_adder port map(cx1,x(29),z(13),cx2);
	H3: half_adder port map(cx2,x(30),z(14),cx3);
	H4: half_adder port map(cx3,x(31),z(15),cx4);

	BUF1: buffer_1 port map(x(0),z(0));
	BUF2: buffer_1 port map(x(1),z(1));
	BUF3: buffer_1 port map(x(2),z(2));
	BUF4: buffer_1 port map(x(3),z(3));
	BUF5: buffer_1 port map(sum_2(0),z(4));
	BUF6: buffer_1 port map(sum_2(1),z(5));
	BUF7: buffer_1 port map(sum_2(2),z(6));
	BUF8: buffer_1 port map(sum_2(3),z(7));
	BUF9: buffer_1 port map(sum_2(4),z(8));
	BUF10: buffer_1 port map(sum_2(5),z(9));
	BUF11: buffer_1 port map(sum_2(6),z(10));
	BUF12: buffer_1 port map(sum_2(7),z(11));

end Behavioral;

