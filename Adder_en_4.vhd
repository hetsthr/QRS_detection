----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:12:39 05/26/2020 
-- Design Name: 
-- Module Name:    Adder_en_4 - Behavioral 
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

entity Adder_en_4 is
	port(A,B:in std_logic_vector(3 downto 0); Cin,CLK:in std_logic; Sum:out std_logic_vector(3 downto 0); carry:out std_logic); 
end Adder_en_4;

architecture Behavioral of Adder_en_4 is
component PFA
	port(A,B,C:in std_logic; S,G,P:out std_logic);
end component;
component and_1
	port(x,y:in std_logic; z:out std_logic);
end component;
component and_3
	port(a,b,c:in std_logic; z:out std_logic);
end component;
component and_4
	port(a,b,c,d:in std_logic; z:out std_logic);
end component;
component or_1
	port (x,y:in std_logic; z:out std_logic);
end component;
component or_3
	port(a,b,c:in std_logic; z:out std_logic);
end component;
component or_4
	port(a,b,c,d:in std_logic; z:out std_logic);
end component;
component or_5
	port(a,b,c,d,e:in std_logic; z:out std_logic);
end component;
component buffer_en
	port(x,CLK:in std_logic; y: out std_logic);
end component;
signal G,P:std_logic_vector(3 downto 0);
signal Cint:std_logic_vector(2 downto 0);
signal s1:std_logic_vector(9 downto 0);
signal x: std_logic;
begin
	
	PFA_1: PFA port map(A(0),B(0),Cin,Sum(0),G(0),P(0));
	A1: and_1 port map(P(0),Cin,s1(0));
	O1: or_1 port map(s1(0),G(0),Cint(0));
	
	PFA_2: PFA port map(A(1),B(1),Cint(0),Sum(1),G(1),P(1));
	A2: and_1 port map(P(1),G(0),s1(1));
	A3: and_3 port map(P(1),P(0),Cin,s1(2));
	O2: or_3 port map(s1(1),s1(2),G(1),Cint(1));
	
	PFA_3: PFA port map(A(2),B(2),Cint(1),Sum(2),G(2),P(2));
	A4: and_1 port map(P(2),G(1),s1(3));
	A5: and_3 port map(P(2),P(1),G(0),s1(4));
	A6: and_4 port map(P(2),P(1),P(0),Cin,s1(5));
	O3: or_4 port map(s1(3),s1(4),s1(5),G(2),Cint(2));
	
	PFA_4: PFA port map(A(3),B(3),Cint(2),Sum(3),G(3),P(3));
	A7: and_1 port map(P(3),G(2),s1(6));
	A8: and_3 port map(P(3),P(2),G(1),s1(7));
	A9: and_4 port map(P(3),P(2),P(1),G(0),s1(8));
	A10: and_4 port map(P(3),P(2),P(1),P(0),x);
	A11: and_1 port map(x,Cin,s1(9));
	O4: or_5 port map(s1(6),s1(7),s1(8),s1(9),G(3),carry);
	
end Behavioral;

