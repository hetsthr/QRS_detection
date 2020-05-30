----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:21:03 05/25/2020 
-- Design Name: 
-- Module Name:    Five_point - Behavioral 
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

entity Five_point is
	port(data_in:in std_logic_vector(7 downto 0);CLK,Set,Reset:in std_logic;five_pt:out std_logic_vector(7 downto 0));
end Five_point;

architecture Behavioral of Five_point is
component Shift_Register_8
	port(data:in std_logic_vector(7 downto 0);CLK,S,R:in std_logic;Q0,Q1,Q2,Q3,Q4:out std_logic_vector(7 downto 0));
end component;

component signed_multiplier
	port( a,b: in std_logic_vector(7 downto 0);
			p: out std_logic_vector (15 downto 0)
			);
end component;

component twos_comp
	port(	a: in std_logic_vector (7 downto 0);
			b: out std_logic_vector (7 downto 0)
			);
end component;

component twos_comp_16
		port(	a: in std_logic_vector (15 downto 0);
				b: out std_logic_vector (15 downto 0)
				);
	end component;

component buffer_8
	port(x:in std_logic_vector(7 downto 0); y:out std_logic_vector(7 downto 0));
end component;

component buffer_en
	port(x:in std_logic_vector(15 downto 0); en:in std_logic; y: out std_logic_vector(15 downto 0));
end component;

component and_1
	port(x,y:in std_logic; z:out std_logic);
end component;

component and_3
	port(a,b,c:in std_logic; z:out std_logic);
end component;

component not_1
	port(x:in std_logic; y:out std_logic);
end component;

component Counter_3
	port(Set,Reset,CLK:in std_logic;
	Q0,Q1,Q2:out std_logic);
end component;

component Adder5_16
	port(a,b,c,d: in std_logic_vector(15 downto 0); Sum:out std_logic_vector(15 downto 0); Carry:out std_logic); 
end component;

type arr is array (4 downto 0) of std_logic_vector(7 downto 0);
type arr1 is array (1 downto 0) of std_logic_vector(7 downto 0);
type arr2 is array (2 downto 0) of std_logic;
type arr3 is array (1 downto 0) of std_logic_vector(15 downto 0);
type arr4 is array (2 downto 0) of std_logic_vector(15 downto 0);
signal out1: arr;
signal y2:arr3;
signal x: arr1;
signal q: arr2;
signal d,c_d: arr4;
signal c_x,Sum_tru: std_logic_vector(7 downto 0);
signal c_y,cx_1,cx_2,s_add,Sum,five_pt_d: std_logic_vector(15 downto 0); 
signal CLK_1,en_1,en_2,c_q,y1,c_y1,Carry:std_logic;
begin
	
	SH1: Shift_Register_8 port map(data_in,CLK,Set,Reset,out1(0),out1(1),out1(2),out1(3),out1(4));

	
	BUF1: buffer_8 port map(out1(0),x(0));
	C0: twos_comp port map(x(0),c_x);
	MUL2: signed_multiplier port map(out1(1),"10000000",y2(0));
	MUL3: signed_multiplier port map(out1(3),"10000000",y2(1));
	C1: twos_comp_16 port map(y2(1),c_y);
	BUF2: buffer_8 port map(out1(4),x(1));

	CT1: Counter_3 port map(Set,Reset,CLK_1,q(0),q(1),q(2));
	N1: not_1 port map(q(1),c_q);
	A1: and_3 port map(q(0),c_q,q(2),y1);
	N2: not_1 port map(y1,c_y1);
	A3: and_1 port map(CLK,c_y1,CLK_1);

	A4: and_1 port map(y1,CLK,en_2);

	cx_1 <= "00000000" & c_x;
	cx_2 <= "00000000" & x(1);
	ADD1: Adder5_16 port map(cx_1,y2(0),c_y,cx_2,s_add,Carry);
	
	BUFEN1: buffer_en port map (s_add,en_2,Sum);
	
	Sum_tru <= Sum(13 downto 6);
	
	MUL4: signed_multiplier port map(Sum_tru,"11000000",d(0));
	MUL5: signed_multiplier port map(d(0)(13 downto 6),"10000000",d(1));
	C2: twos_comp_16 port map(d(1),c_d(0));
	MUL6: signed_multiplier port map(c_d(0)(13 downto 6),"10000000",d(2));
	C3: twos_comp_16 port map(d(2),c_d(1));
	MUL7: signed_multiplier port map(c_d(1)(13 downto 6),"01010000",five_pt_d);
	five_pt <= five_pt_d(13 downto 6);
	
end Behavioral;

