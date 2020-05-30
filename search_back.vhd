----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:11:00 05/28/2020 
-- Design Name: 
-- Module Name:    search_back - Behavioral 
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

entity search_back is
	port(data_in:in std_logic_vector(19 downto 0); CLK,Set,Reset:in std_logic; R_add: out std_logic_vector(11 downto 0));
end search_back;

architecture Behavioral of search_back is
component Shift_Register_12
	port(data:in std_logic_vector(11 downto 0);CLK,S,R:in std_logic;Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8:out std_logic_vector(11 downto 0));
end component;
component Shift_Register8_12
port(data:in std_logic_vector(11 downto 0);CLK,S,R:in std_logic;Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7:out std_logic_vector(11 downto 0));
end component;
component Shift_Register8_8
port(data:in std_logic_vector(7 downto 0);CLK,S,R:in std_logic;Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8:out std_logic_vector(7 downto 0));
end component;
component Counter_4
	port(Set,Reset,CLK:in std_logic; Q0,Q1,Q2,Q3:out std_logic);
end component;
component Counter_3
	port(Set,Reset,CLK:in std_logic; Q0,Q1,Q2:out std_logic);
end component;
component Adder8_12
	port(a,b,c,d,e,f,g,h: in std_logic_vector(11 downto 0); Sum:out std_logic_vector(11 downto 0); Carry:out std_logic); 
end component;
component buffer12_en
	port(x:in std_logic_vector(11 downto 0); en:in std_logic; y: out std_logic_vector(11 downto 0));
end component;
component and_1
	port(x,y:in std_logic; z:out std_logic);
end component;
component not_1
	port(x:in std_logic; y:out std_logic);
end component;
component signed_multiplier 
	port( a,b: in std_logic_vector(7 downto 0);
			p: out std_logic_vector (15 downto 0)
			);
end component;
component twos_comp_12
	port(x: in std_logic_vector(11 downto 0); y:out std_logic_vector(11 downto 0));
end component;
component Adder_12
port(A,B:in std_logic_vector(11 downto 0); Cin:in std_logic; Sum:out std_logic_vector(11 downto 0); carry:out std_logic); 
end component;
component mul_shift_12
port(x:in std_logic_vector(11 downto 0); y:out std_logic_vector(11 downto 0));
end component;
component mux8_1
port(a,b,c,d,e,f,g,h:in std_logic_vector(11 downto 0);s0,s1,s2:in std_logic;
out1:out std_logic_vector(11 downto 0));
end component;
--component Comparator_16
--	Port (a: in  std_logic_vector(15 downto 0);
--	b : in  std_logic_vector(15 downto 0);
--	z: out  std_logic);
--end component;
component Comparator_12 
	port (a: in  std_logic_vector(11 downto 0);
	b : in  std_logic_vector(11 downto 0);
	z: out  std_logic);
end component;
component mul_16
port (a,b:in std_logic_vector(15 downto 0); z: out std_logic_vector(31 downto 0)); 
end component;
component and_3 
	port(a,b,c:in std_logic; z:out std_logic);
end component;
component buffer_16
port(x:in std_logic_vector(15 downto 0); y:out std_logic_vector(15 downto 0));
end component;
type arr is array(8 downto 0) of std_logic_vector(11 downto 0);
type arr1 is array(7 downto 0) of std_logic_vector(11 downto 0);
type arr2 is array(8 downto 0) of std_logic_vector(7 downto 0);
signal q,c_q,RR_2,Rpeak:arr;
signal q2:arr1;
signal q_d:arr2;
signal count,count2:std_logic_vector(3 downto 0);
signal count1,c_count2,count3:std_logic_vector(2 downto 0);
signal x1,x2,c_count:std_logic_vector(1 downto 0);
signal Cx1,Cx2,en1,en1_c,en3,en3_c,CLK_1,CLK_1b,CLK_2,CLK_3,c_qq1,c_qq2,c_qq3,c_qq4,c_qq5,c_qq6,c_qq7,c_qq8,c_rr2,c_rr3: std_logic;
signal RRcmp1: std_logic_vector(15 downto 0);
signal c1,c2,RR_1,c3: std_logic_vector(7 downto 0);
signal R_add1,Sum_d1,Sum_d2,RRavg1,RRavg2,Sum1,Sum2,d_qq1,d_qq2,d_qq3,d_qq4,d_qq5,d_qq6,d_qq7,d_qq8,mux_12,mux2_12,data_in_d: std_logic_vector(11 downto 0);
signal RRavg1_92,RRavg1_116,RRavg2_166: std_logic_vector(31 downto 0);
begin

	--BUFEN012: buffer12_en port map(data_in(11 downto 0),CLK,data_in_d);
	
	SH1: Shift_Register_12 port map(data_in(11 downto 0),CLK,Set,Reset,q(0),q(1),q(2),q(3),q(4),q(5),q(6),q(7),q(8));
	--SHD1: Shift_Register8_8 port map(data_in(19 downto 12),CLK,Set,Reset,q_d(0),q_d(1),q_d(2),q_d(3),q_d(4),q_d(5),q_d(6),q_d(7),q_d(8));
	
	CT1: Counter_4 port map(Set,Reset,CLK_1,count(0),count(1),count(2),count(3));
	N1: not_1 port map(count(1),c_count(0));
	N2: not_1 port map(count(2),c_count(1));
	A1: and_1 port map(count(3),c_count(1),x1(0));
	A2: and_1 port map(c_count(0),count(0),x1(1));
	A3: and_1 port map(x1(0),x1(1),en1);
	N3: not_1 port map(en1,en1_c);
	A4: and_1 port map(en1_c,CLK,CLK_1);

	
	CMP1: twos_comp_12 port map(q(1),c_q(0));
	SUB1: Adder_12 port map(q(0),c_q(0),'0',d_qq1,c_qq8);
	CMP2: twos_comp_12 port map(q(2),c_q(1));
	SUB2: Adder_12 port map(q(0),c_q(1),'0',d_qq2,c_qq7);
	CMP3: twos_comp_12 port map(q(3),c_q(2));
	SUB3: Adder_12 port map(q(0),c_q(2),'0',d_qq3,c_qq6);
	CMP4: twos_comp_12 port map(q(4),c_q(3));
	SUB4: Adder_12 port map(q(0),c_q(3),'0',d_qq4,c_qq5);
	CMP5: twos_comp_12 port map(q(5),c_q(4));
	SUB5: Adder_12 port map(q(0),c_q(4),'0',d_qq5,c_qq4);
	CMP6: twos_comp_12 port map(q(6),c_q(5));
	SUB6: Adder_12 port map(q(0),c_q(5),'0',d_qq6,c_qq3);
	CMP7: twos_comp_12 port map(q(7),c_q(6));
	SUB7: Adder_12 port map(q(0),c_q(6),'0',d_qq7,c_qq2);
	CMP8: twos_comp_12 port map(q(8),c_q(7));
	SUB8: Adder_12 port map(q(0),c_q(7),'0',d_qq8,c_qq1);
	
	ADD1: Adder8_12 port map(d_qq1,d_qq2,d_qq3,d_qq4,d_qq5,d_qq6,d_qq7,d_qq8,Sum_d1,Cx1);
	BUFEN11: buffer12_en port map(Sum_d1,en1,Sum1);
	
	DIV8: mul_shift_12 port map(Sum1,RRavg1);
	BUF1: buffer_16 port map(RRavg1&"0000",RRcmp1);
	MUL1: mul_16 port map(RRcmp1,"0000000000001111",RRavg1_92);
	MUL2: mul_16 port map(RRcmp1,"0000000000010011",RRavg1_116);
	
	
--	CMP121: Comparator_12 port map(d_qq8,RRavg1_92(19 downto 8),c1);
--	CMP122: Comparator_12 port map(RRavg1_116(19 downto 8),q(8),c2);
--	A5: and_3 port map(c1,c2,CLK,CLK_2);
--	SH2: Shift_Register_12 port map(q(8),CLK_2,Set,Reset,q2(0),q2(1),q2(2),q2(3),q2(4),q2(5),q2(6),q2(7),q2(8));
	
	CMP12_1: Comparator_12 port map(d_qq1,RRavg1_92(19 downto 8),c1(0));
	CMP12_2: Comparator_12 port map(RRavg1_116(19 downto 8),d_qq1,c2(0));
	
	CMP12_3: Comparator_12 port map(d_qq2,RRavg1_92(19 downto 8),c1(1));
	CMP12_4: Comparator_12 port map(RRavg1_116(19 downto 8),d_qq2,c2(1));
	
	CMP12_5: Comparator_12 port map(d_qq3,RRavg1_92(19 downto 8),c1(2));
	CMP12_6: Comparator_12 port map(RRavg1_116(19 downto 8),d_qq3,c2(2));
	
	CMP12_7: Comparator_12 port map(d_qq4,RRavg1_92(19 downto 8),c1(3));
	CMP12_8: Comparator_12 port map(RRavg1_116(19 downto 8),d_qq4,c2(3));

	CMP12_9: Comparator_12 port map(d_qq5,RRavg1_92(19 downto 8),c1(4));
	CMP12_10: Comparator_12 port map(RRavg1_116(19 downto 8),d_qq5,c2(4));
	
	CMP12_11: Comparator_12 port map(d_qq6,RRavg1_92(19 downto 8),c1(5));
	CMP12_12: Comparator_12 port map(RRavg1_116(19 downto 8),d_qq6,c2(5));
	
	CMP12_13: Comparator_12 port map(d_qq7,RRavg1_92(19 downto 8),c1(6));
	CMP12_14: Comparator_12 port map(RRavg1_116(19 downto 8),d_qq7,c2(6));
	
	CMP12_15: Comparator_12 port map(d_qq8,RRavg1_92(19 downto 8),c1(7));
	CMP12_16: Comparator_12 port map(RRavg1_116(19 downto 8),d_qq8,c2(7));
	
	A21: and_1 port map(c1(0),c2(0),RR_1(0));
	A22: and_1 port map(c1(1),c2(1),RR_1(1));
	A23: and_1 port map(c1(2),c2(2),RR_1(2));
	A24: and_1 port map(c1(3),c2(3),RR_1(3));
	A25: and_1 port map(c1(4),c2(4),RR_1(4));
	A26: and_1 port map(c1(5),c2(5),RR_1(5));
	A27: and_1 port map(c1(6),c2(6),RR_1(6));
	A28: and_1 port map(c1(7),c2(7),RR_1(7));
	
	BUFEN1: buffer12_en port map(d_qq1,RR_1(0),RR_2(0));
	BUFEN2: buffer12_en port map(d_qq2,RR_1(1),RR_2(1));
	BUFEN3: buffer12_en port map(d_qq3,RR_1(2),RR_2(2));
	BUFEN4: buffer12_en port map(d_qq4,RR_1(3),RR_2(3));
	BUFEN5: buffer12_en port map(d_qq5,RR_1(4),RR_2(4));
	BUFEN6: buffer12_en port map(d_qq6,RR_1(5),RR_2(5));
	BUFEN7: buffer12_en port map(d_qq7,RR_1(6),RR_2(6));
	BUFEN8: buffer12_en port map(d_qq8,RR_1(7),RR_2(7));
	
	A111: and_1 port map(en1,CLK,CLK_1b);
	
	CT2: Counter_3 port map(Set,Reset,CLK_1b,count1(0),count1(1),count1(2));
	
	MUX1: mux8_1 port map(RR_2(0),RR_2(1),RR_2(2),RR_2(3),RR_2(4),RR_2(5),RR_2(6),RR_2(7),count1(0),count1(1),count1(2),mux_12);
--	
	CMP12: Comparator_12 port map(mux_12,"000000000000",c_rr2);
	A29: and_1 port map(c_rr2,CLK,CLK_2);
	SH2: Shift_Register8_12 port map(mux_12,CLK_2,Set,Reset,q2(0),q2(1),q2(2),q2(3),q2(4),q2(5),q2(6),q2(7));
--	
--	
--	CT3: Counter_4 port map(Set,Reset,CLK_3,count2(0),count2(1),count2(2),count2(3));
--	N4: not_1 port map(count2(0),c_count2(0));
--	N5: not_1 port map(count2(1),c_count2(1));
--	N6: not_1 port map(count2(2),c_count2(2));
--	A5: and_1 port map(count2(3),c_count2(0),x2(0));
--	A6: and_1 port map(c_count2(1),c_count2(2),x2(1));
--	A7: and_1 port map(x2(0),x2(1),en3);
--	N7: not_1 port map(en3,en3_c);
--	A8: and_1 port map(en3_c,CLK_2,CLK_3);
--	
--	ADD2: Adder8_12 port map(q2(0),q2(1),q2(2),q2(3),q2(4),q2(5),q2(6),q2(7),Sum_d2,Cx2);
--	BUFEN22: buffer12_en port map(Sum_d2,en3,Sum2);
--	DIV82: mul_shift_12 port map(Sum2,RRavg2);
--	
--	MUL3: mul_16 port map(RRavg2&"0000","0000000000011011",RRavg2_166);
--	
--	CMP12_17: Comparator_12 port map(RRavg2_166(19 downto 8),d_qq1,c3(0));
--	CMP12_18: Comparator_12 port map(RRavg2_166(19 downto 8),d_qq2,c3(1));
--	CMP12_19: Comparator_12 port map(RRavg2_166(19 downto 8),d_qq3,c3(2));
--	CMP12_20: Comparator_12 port map(RRavg2_166(19 downto 8),d_qq4,c3(3));
--	CMP12_21: Comparator_12 port map(RRavg2_166(19 downto 8),d_qq5,c3(4));
--	CMP12_22: Comparator_12 port map(RRavg2_166(19 downto 8),d_qq6,c3(5));
--	CMP12_23: Comparator_12 port map(RRavg2_166(19 downto 8),d_qq7,c3(6));
--	CMP12_24: Comparator_12 port map(RRavg2_166(19 downto 8),d_qq8,c3(7));
--	
--	BUFEN111: buffer12_en port map(d_qq1,c3(0),Rpeak(0));
--	BUFEN12: buffer12_en port map(d_qq2,c3(1),Rpeak(1));
--	BUFEN13: buffer12_en port map(d_qq3,c3(2),Rpeak(2));
--	BUFEN14: buffer12_en port map(d_qq4,c3(3),Rpeak(3));
--	BUFEN15: buffer12_en port map(d_qq5,c3(4),Rpeak(4));
--	BUFEN16: buffer12_en port map(d_qq6,c3(5),Rpeak(5));
--	BUFEN17: buffer12_en port map(d_qq7,c3(6),Rpeak(6));
--	BUFEN18: buffer12_en port map(d_qq8,c3(7),Rpeak(7));
--	
--	CT4: Counter_3 port map(Set,Reset,CLK_3,count3(0),count3(1),count3(2));
--	
--	MUX2: mux8_1 port map(Rpeak(0),Rpeak(1),Rpeak(2),Rpeak(3),Rpeak(4),Rpeak(5),Rpeak(6),Rpeak(7),count3(0),count3(1),count(2),mux2_12);
--	
--	CMP123: Comparator_12 port map(mux2_12,"000000000000",c_rr3);
--	
--	BUFEN221: buffer12_en port map(mux2_12,c_rr3,R_add);
--	
	
	
end Behavioral;

