----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:20:10 05/27/2020 
-- Design Name: 
-- Module Name:    Counter_6 - Behavioral 
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

entity Counter_6 is
	port(Set,Reset,CLK:in std_logic;
	Q:out std_logic_vector(5 downto 0));
end Counter_6;

architecture Behavioral of Counter_6 is
component JK_Flip_Flop
	port(J,K,CLK,Set,Reset : in std_logic;
	Q,Q_bar: out std_logic);
end component;

component buffer_1
	port (x:in std_logic; y:out std_logic);
end  component;

component and_1 is
	port (x,y:in std_logic; z:out std_logic);
end component;

signal P:std_logic_vector(5 downto 0) := "000000";
signal q_bar:std_logic_vector(5 downto 0);
signal x:std_logic_vector(3 downto 0);

begin
	BUF0: buffer_1 port map(P(0),Q(0));
	BUF1: buffer_1 port map(P(1),Q(1));
	BUF2: buffer_1 port map(P(2),Q(2));
	BUF3: buffer_1 port map(P(3),Q(3));
	BUF4: buffer_1 port map(P(4),Q(4));
	BUF5: buffer_1 port map(P(5),Q(5));
	
	A1: and_1 port map (P(0),P(1),x(0));
	A2: and_1 port map (x(0),P(2),x(1));
	A3: and_1 port map (x(1),P(3),x(2));
	A4: and_1 port map (x(2),P(4),x(3));
	
	JKFF1: JK_Flip_Flop port map('1','1',CLK,Set,Reset,P(0),q_bar(0));
	JKFF2: JK_Flip_Flop port map(P(0),P(0),CLK,Set,Reset,P(1),q_bar(1));
	JKFF3: JK_Flip_Flop port map(x(0),x(0),CLK,Set,Reset,P(2),q_bar(2));
	JKFF4: JK_Flip_Flop port map(x(1),x(1),CLK,Set,Reset,P(3),q_bar(3));
	JKFF5: JK_Flip_Flop port map(x(2),x(2),CLK,Set,Reset,P(4),q_bar(4));
	JKFF6: JK_Flip_Flop port map(x(3),x(3),CLK,Set,Reset,P(5),q_bar(5));



end Behavioral;

