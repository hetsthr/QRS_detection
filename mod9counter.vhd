----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:21:35 05/26/2020 
-- Design Name: 
-- Module Name:    mod9counter - Behavioral 
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

entity mod9counter is
port(CLEAR,R,clk:in std_logic;
Q0,Q1,Q2,Q3,Q0_BAR,Q1_BAR,Q2_BAR,Q3_BAR:out std_logic);
end mod9counter;

architecture Structural of mod9counter is
component JKflipflop is
port(J,K,CLK,CLEAR,R : in std_logic;
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

signal P:std_logic_vector(3 downto 0) := "0000";
--signal Q:std_logic_vector(2 downto 0);
signal X:std_logic := '1';
signal Y,A,B,C,D:std_logic;
signal clk_b:std_logic;
begin
Q0<=P(0);
Q1<=P(1);
Q2<=P(2);
Q3<=P(3);
A<=P(0) and P(1);
B<=P(0) and P(1) and P(2);
C<=not(P(2)) and P(3);
D<=not(P(0));
a1:JKflipflop port map(D,'1',clk,CLEAR,R,P(0),Q0_BAR);
a2:JKflipflop port map(P(0),P(0),clk,CLEAR,R,P(1),Q1_BAR);
a3:JKflipflop port map(A,A,clk,CLEAR,R,P(2),Q2_BAR);
a4:JKflipflop port map(B,C,clk,CLEAR,R,P(3),Q3_BAR);
end Structural;