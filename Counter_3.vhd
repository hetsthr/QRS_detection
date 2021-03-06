----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:48:19 05/25/2020 
-- Design Name: 
-- Module Name:    Counter_3 - Behavioral 
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

entity Counter_3 is
	port(Set,Reset,CLK:in std_logic;
	Q0,Q1,Q2:out std_logic);
end Counter_3;

architecture Behavioral of Counter_3 is
component JK_Flip_Flop
	port(J,K,CLK,Set,Reset : in std_logic;
	Q,Q_bar: out std_logic);
end component;

component buffer_1
	port (x:in std_logic; y:out std_logic);
end  component;

component not_1 is
	port (x:in std_logic; y:out std_logic);
end component;

component and_1 is
	port (x,y:in std_logic; z:out std_logic);
end component;

--component D_Flip_Flop
--	port (D,CLK,S,R:IN STD_LOGIC; Q,Q_BAR:OUT STD_LOGIC); 
--end component;

signal P:std_logic_vector(2 downto 0) := "000";
signal q_bar:std_logic_vector(2 downto 0);
signal x:std_logic;

begin
	BUF0: buffer_1 port map(P(0),Q0);
	BUF1: buffer_1 port map(P(1),Q1);
	BUF2: buffer_1 port map(P(2),Q2);
	
	A2: and_1 port map (P(0),P(1),x);
	JKFF1: JK_Flip_Flop port map('1','1',CLK,Set,Reset,P(0),q_bar(0));
	JKFF2: JK_Flip_Flop port map(P(0),P(0),CLK,Set,Reset,P(1),q_bar(1));
	JKFF3: JK_Flip_Flop port map(x,x,CLK,Set,Reset,P(2),q_bar(2));

	
end Behavioral;

