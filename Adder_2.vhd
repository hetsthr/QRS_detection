----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:34:05 05/15/2020 
-- Design Name: 
-- Module Name:    Adder_2 - Behavioral 
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

entity Adder_2 is
port(A,B:in std_logic_vector(1 downto 0); Cin:in std_logic; Sum:out std_logic_vector(1 downto 0); carry:out std_logic); 
end Adder_2;

architecture Behavioral of Adder_2 is
component PFA
	port(A,B,C:in std_logic; S,G,P:out std_logic);
end component;
component and_1
	port(x,y:in std_logic; z:out std_logic);
end component;
component and_3
	port(a,b,c:in std_logic; z:out std_logic);
end component;
component or_1
	port (x,y:in std_logic; z:out std_logic);
end component;
component or_3
	port(a,b,c:in std_logic; z:out std_logic);
end component;
signal G,P:std_logic_vector(1 downto 0);
signal Cint:std_logic;
signal s1:std_logic_vector(2 downto 0);
begin

	PFA_1: PFA port map(A(0),B(0),Cin,Sum(0),G(0),P(0));
	A1: and_1 port map(P(0),Cin,s1(0));
	O1: or_1 port map(s1(0),G(0),Cint);
	
	PFA_2: PFA port map(A(1),B(1),Cint,Sum(1),G(1),P(1));
	A2: and_1 port map(P(1),G(0),s1(1));
	A3: and_3 port map(P(1),P(0),Cin,s1(2));
	O2: or_3 port map(s1(1),s1(2),G(1),carry);

end Behavioral;

