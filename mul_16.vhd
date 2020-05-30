----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:57:29 05/29/2020 
-- Design Name: 
-- Module Name:    mul_16 - Behavioral 
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

entity mul_16 is
port (a,b:in std_logic_vector(15 downto 0); z: out std_logic_vector(31 downto 0)); 
end mul_16;

architecture Behavioral of mul_16 is
component mul_8
port(a,b:in std_logic_vector(7 downto 0); z:out std_logic_vector(15 downto 0));
end component;
component Adder_16
port(A,B:in std_logic_vector(15 downto 0); Cin:in std_logic; Sum:out std_logic_vector(15 downto 0); carry:out std_logic); 
end component;
component or_1 
port(x,y:in std_logic; z:out std_logic);
end component;
component half_adder
		port(	a,b: in std_logic;
				s,c: out std_logic
				);
end component;
component buffer_1
	port(x:in std_logic; y:out std_logic);
end component;

signal x: std_logic_vector(63 downto 0);
signal sum_1,sum_2: std_logic_vector(15 downto 0);
signal cx_1,cx_2,cx,cx1,cx2,cx3,cx4,cx5,cx6,cx7,cx8: std_logic;
begin

	MUL1: mul_8 port map(a(7 downto 0),b(7 downto 0),x(15 downto 0));
	MUL2: mul_8 port map(a(7 downto 0),b(15 downto 8),x(31 downto 16));
	MUL3: mul_8 port map(a(15 downto 8),b(7 downto 0),x(47 downto 32));
	MUL4: mul_8 port map(a(15 downto 8),b(15 downto 8),x(63 downto 48));
	
	ADD1: Adder_16 port map(x(31 downto 16),x(47 downto 32),'0',sum_1,cx_1);
	ADD2: Adder_16 port map(sum_1,x(55 downto 48)&x(15 downto 8),'0',sum_2,cx_2);
	
	O1: or_1 port map(cx_1,cx_2,cx);
	H1: half_adder port map(x(56),cx,z(24),cx1);
	H2: half_adder port map(x(57),cx1,z(25),cx2);
	H3: half_adder port map(x(58),cx2,z(26),cx3);
	H4: half_adder port map(x(59),cx3,z(27),cx4);
	H5: half_adder port map(x(60),cx4,z(28),cx5);
	H6: half_adder port map(x(61),cx5,z(29),cx6);
	H7: half_adder port map(x(62),cx6,z(30),cx7);
	H8: half_adder port map(x(63),cx7,z(31),cx8);
	
	BUF1: buffer_1 port map(x(0),z(0));
	BUF2: buffer_1 port map(x(1),z(1));
	BUF3: buffer_1 port map(x(2),z(2));
	BUF4: buffer_1 port map(x(3),z(3));
	BUF5: buffer_1 port map(x(4),z(4));
	BUF6: buffer_1 port map(x(5),z(5));
	BUF7: buffer_1 port map(x(6),z(6));
	BUF8: buffer_1 port map(x(7),z(7));
	BUF9: buffer_1 port map(sum_2(0),z(8));
	BUF10: buffer_1 port map(sum_2(1),z(9));
	BUF11: buffer_1 port map(sum_2(2),z(10));
	BUF12: buffer_1 port map(sum_2(3),z(11));
	BUF13: buffer_1 port map(sum_2(4),z(12));
	BUF14: buffer_1 port map(sum_2(5),z(13));
	BUF15: buffer_1 port map(sum_2(6),z(14));
	BUF16: buffer_1 port map(sum_2(7),z(15));
	BUF17: buffer_1 port map(sum_2(8),z(16));
	BUF18: buffer_1 port map(sum_2(9),z(17));
	BUF19: buffer_1 port map(sum_2(10),z(18));
	BUF20: buffer_1 port map(sum_2(11),z(19));
	BUF21: buffer_1 port map(sum_2(12),z(20));
	BUF22: buffer_1 port map(sum_2(13),z(21));
	BUF23: buffer_1 port map(sum_2(14),z(22));
	BUF24: buffer_1 port map(sum_2(15),z(23));
	
	
	
end Behavioral;

