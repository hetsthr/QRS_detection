----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:28:26 05/28/2020 
-- Design Name: 
-- Module Name:    sync_d_ff_r - Behavioral 
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

entity sync_d_ff_r is
	port(	clk,reset,D_in: in std_logic;
			q,q_b: out std_logic
			);
end sync_d_ff_r;

architecture Behavioral of sync_d_ff_r is
	component d_latch
		port(	d,clk : in std_logic;
				q,q_bar : out std_logic
				);
	end component;
	signal not_clk,clr,a,b,c: std_logic;
begin
	not_clk <= not clk;
	c <= D_in and reset;
	latch_1: d_latch port map(c,not_clk,a,b);
	latch_2: d_latch port map(a,clk,q,q_b);
end Behavioral;
