----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:43:24 05/26/2020 
-- Design Name: 
-- Module Name:    Moving_Avg - Behavioral 
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


entity Moving_Avg is
	port(data_in:in std_logic_vector(7 downto 0); CLK,Set,Reset:in std_logic; mvg_avg:out std_logic_vector(7 downto 0));
end Moving_Avg;

architecture Behavioral of Moving_Avg is
component Shift_Register_8
	port(data:in std_logic_vector(7 downto 0);CLK,S,R:in std_logic;Q0,Q1,Q2,Q3,Q4:out std_logic_vector(7 downto 0));
end component;

component Shift_Register_8_2
	port(data:in std_logic_vector(7 downto 0);CLK,S,R:in std_logic;Q0,Q1,Q2,Q3:out std_logic_vector(7 downto 0));
end component;

component Counter_6
		port(Set,Reset,CLK:in std_logic; Q:out std_logic_vector(5 downto 0));
end component;

component Adder5_8
	port(a,b,c,d,e: in std_logic_vector(7 downto 0); Sum:out std_logic_vector(7 downto 0); Carry:out std_logic); 
end component;

component Adder_8
	port(A,B:in std_logic_vector(7 downto 0); Cin:in std_logic; Sum:out std_logic_vector(7 downto 0); carry:out std_logic); 
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

component buffer8_en
	port(x:in std_logic_vector(7 downto 0); en:in std_logic; y: out std_logic_vector(7 downto 0));
end component;

component buffer_8
	port (x:in std_logic_vector(7 downto 0); y:out std_logic_vector(7 downto 0));
end component;

component signed_multiplier
	port( a,b: in std_logic_vector(7 downto 0);
			p: out std_logic_vector (15 downto 0)
			);
end component;

type arr is array (53 downto 0) of std_logic_vector(7 downto 0);
type arr1 is array (12 downto 0) of std_logic_vector(7 downto 0);
signal qt: arr;
signal data_7,data_11: std_logic_vector(15 downto 0);
signal s: arr1;
signal Sum,Sum_d: std_logic_vector(7 downto 0);
signal c: std_logic_vector(13 downto 0);
signal count,x: std_logic_vector(5 downto 0);
signal CLK_1,en,en_c: std_logic;
begin

	MUL1: signed_multiplier port map(data_in,"00000111",data_7);
	SH1: Shift_Register_8 port map(data_7(13 downto 6),CLK,Set,Reset,qt(0),qt(1),qt(2),qt(3),qt(4));
	SH2: Shift_Register_8 port map(qt(4),CLK,Set,Reset,qt(5),qt(6),qt(7),qt(8),qt(9));
	SH3: Shift_Register_8 port map(qt(9),CLK,Set,Reset,qt(10),qt(11),qt(12),qt(13),qt(14));
	SH4: Shift_Register_8 port map(qt(14),CLK,Set,Reset,qt(15),qt(16),qt(17),qt(18),qt(19));
	SH5: Shift_Register_8 port map(qt(19),CLK,Set,Reset,qt(20),qt(21),qt(22),qt(23),qt(24));
	SH6: Shift_Register_8 port map(qt(24),CLK,Set,Reset,qt(25),qt(26),qt(27),qt(28),qt(29));
	SH7: Shift_Register_8 port map(qt(29),CLK,Set,Reset,qt(30),qt(31),qt(32),qt(33),qt(34));
	SH8: Shift_Register_8 port map(qt(34),CLK,Set,Reset,qt(35),qt(36),qt(37),qt(38),qt(39));
	SH9: Shift_Register_8 port map(qt(39),CLK,Set,Reset,qt(40),qt(41),qt(42),qt(43),qt(44));
	SH10: Shift_Register_8 port map(qt(44),CLK,Set,Reset,qt(45),qt(46),qt(47),qt(48),qt(49));
	SH11: Shift_Register_8_2 port map(qt(49),CLK,Set,Reset,qt(50),qt(51),qt(52),qt(53));

	CT1: Counter_6 port map(Set,Reset,CLK_1,count);
	N1: not_1 port map(count(0),x(0));
	N2: not_1 port map(count(3),x(1));
	A1: and_3 port map(x(0),count(1),count(2),x(2));
	A2: and_3 port map(x(1),count(4),count(5),x(3));
	A3: and_1 port map(x(2),x(3),en);
	N3: not_1 port map(en,en_c);
	A4: and_1 port map(en_c,CLK,CLK_1);
	
	ADD1: Adder5_8 port map(qt(0),qt(1),qt(2),qt(3),qt(4),s(0),c(0));
	ADD2: Adder5_8 port map(qt(5),qt(6),qt(7),qt(8),qt(9),s(1),c(1));
	ADD3: Adder5_8 port map(qt(10),qt(11),qt(12),qt(13),qt(14),s(2),c(2));
	ADD4: Adder5_8 port map(qt(15),qt(16),qt(17),qt(18),qt(19),s(3),c(3));
	ADD5: Adder5_8 port map(qt(20),qt(21),qt(22),qt(23),qt(24),s(4),c(4));
	ADD6: Adder5_8 port map(qt(25),qt(26),qt(27),qt(28),qt(29),s(5),c(5));
	ADD7: Adder5_8 port map(qt(30),qt(31),qt(32),qt(33),qt(34),s(6),c(6));
	ADD8: Adder5_8 port map(qt(35),qt(36),qt(37),qt(38),qt(39),s(7),c(7));
	ADD9: Adder5_8 port map(qt(40),qt(41),qt(42),qt(43),qt(44),s(8),c(8));
	ADD10: Adder5_8 port map(qt(45),qt(46),qt(47),qt(48),qt(49),s(9),c(9));
	
	ADD11: Adder5_8 port map(s(0),s(1),s(2),s(3),s(4),s(10),c(10));
	ADD12: Adder5_8 port map(s(5),s(6),s(7),s(8),s(9),s(11),c(11));
	ADD13: Adder5_8 port map(qt(50),qt(51),qt(52),qt(53),s(10),s(12),c(12));
	ADD14: Adder_8 port map(s(11),s(12),'0',Sum_d,c(13));
	
	BUFEN1: buffer8_en port map(Sum_d,en,Sum);
	MUL2: signed_multiplier port map(Sum,"00001011",data_11);
	BUF1: buffer_8 port map(data_11(13 downto 6),mvg_avg);
	
	
end Behavioral;

