----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:04:45 04/28/2020 
-- Design Name: 
-- Module Name:    d_ff - Behavioral 
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

entity d_ff is
port(	D:IN STD_LOGIC;
		CLK:IN STD_LOGIC; 
		Q:OUT STD_LOGIC
		); 
end d_ff;

architecture Behavioral of d_ff is
component d_latch
		port(	d,clk : in std_logic;
				q,q_bar : out std_logic
				);
	end component;
	signal not_clk,a,b,q_b: std_logic;
begin	
	not_clk <= not clk;
	latch_1: d_latch port map(D,not_clk,a,b);
	latch_2: d_latch port map(a,clk,Q,q_b);
end Behavioral;

