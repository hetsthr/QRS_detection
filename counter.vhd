----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:11:07 05/23/2020 
-- Design Name: 
-- Module Name:    counter - Behavioral 
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

entity counter is
port(CLEAR,R,clk:in std_logic;
Q0,Q1,Q2,Q0_BAR,Q1_BAR,Q2_BAR:out std_logic);
end counter;

architecture Structural of counter is
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

signal P:std_logic_vector(2 downto 0) := "000";
--signal Q:std_logic_vector(2 downto 0);
signal X:std_logic := '1';
signal Y:std_logic;
signal clk_b:std_logic;
begin
Q0<=P(0);
Q1<=P(1);
Q2<=P(2);
Q2_BAR<=X;
a2:and_1 port map (P(0),P(1),Y);
a1:not_1 port map(clk,clk_b);
d1:JKflipflop port map('1','1',clk,CLEAR,R,P(0),Q0_BAR);
d2:JKflipflop port map(P(0),P(0),clk,CLEAR,R,P(1),Q1_BAR);
d3:JKflipflop port map(Y,Y,clk,CLEAR,R,P(2),X);
end Structural;