----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:36:10 05/29/2020 
-- Design Name: 
-- Module Name:    mul_4 - Behavioral 
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

entity mul_4 is
port(a,b:in std_logic_vector(3 downto 0); z:out std_logic_vector(7 downto 0));
end mul_4;

architecture Behavioral of mul_4 is
component multiplier_2
	port(	a,b: in std_logic_vector(1 downto 0);
			m: out std_logic_vector(3 downto 0)
			);
end component;
component or_1
	port(x,y:in std_logic; z:out std_logic);
end component;
component Adder_4
port(A,B:in std_logic_vector(3 downto 0); Cin:in std_logic; Sum:out std_logic_vector(3 downto 0); carry:out std_logic); 
end component;
component half_adder
		port(	a,b: in std_logic;
				s,c: out std_logic
				);
end component;
component buffer_1
	port(x:in std_logic; y:out std_logic);
end component;
signal x: std_logic_vector(15 downto 0);
signal sum_1,sum_2:std_logic_vector(3 downto 0);
signal cx_1,cx_2,cx,cx1,cx2: std_logic;
begin

	MUL1: multiplier_2 port map(a(1 downto 0),b(1 downto 0),x(3 downto 0));
	MUL2: multiplier_2 port map(a(3 downto 2),b(1 downto 0),x(7 downto 4));
	MUL3: multiplier_2 port map(a(1 downto 0),b(3 downto 2),x(11 downto 8));
	MUL4: multiplier_2 port map(a(3 downto 2),b(3 downto 2),x(15 downto 12));
	
	ADD1: Adder_4 port map(x(7 downto 4),x(11 downto 8),'0',sum_1,cx_1);
	ADD2: Adder_4 port map(sum_1,x(13)&x(12)&x(3)&x(2),'0',sum_2,cx_2);
	
	O1: or_1 port map(cx_1,cx_2,cx);
	H1: half_adder port map(cx,x(14),z(6),cx1);
	H2: half_adder port map(cx1,x(15),z(7),cx2);
	
	BUF1: buffer_1 port map(x(0),z(0));
	BUF2: buffer_1 port map(x(1),z(1));
	BUF3: buffer_1 port map(sum_2(0),z(2));
	BUF4: buffer_1 port map(sum_2(1),z(3));
	BUF5: buffer_1 port map(sum_2(2),z(4));
	BUF6: buffer_1 port map(sum_2(3),z(5));
end Behavioral;

