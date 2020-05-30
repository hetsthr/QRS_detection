----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:55:51 05/12/2020 
-- Design Name: 
-- Module Name:    D_Flip_Flop - Behavioral 
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

entity D_Flip_Flop is
port (D,CLK,S,R:IN STD_LOGIC; Q,Q_BAR:OUT STD_LOGIC); 
end D_Flip_Flop;

architecture Behavioral of D_Flip_Flop is
component D_latch
	port (D,CLK,Set,Reset:IN STD_LOGIC; Q,Q_BAR:OUT STD_LOGIC); 
end component;
component not_1
	port(x:in std_logic; y:out std_logic);
end component;
signal clk_b,q1,q2:std_logic;
begin	
	D1_latch: D_latch port map(D,clk_b,S,R,q1,q2); -- Master
	N1: not_1 port map(CLK,clk_b);
	D2_latch: D_latch port map(q1,CLK,S,R,Q,Q_BAR); -- Slave
end Behavioral;