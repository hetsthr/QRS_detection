----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:17:24 05/23/2020 
-- Design Name: 
-- Module Name:    d_ff_r - Behavioral 
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

entity d_ff_r is
	port(	clk,reset,D_in: in std_logic;
			q,q_b: out std_logic
			);
end d_ff_r;

architecture Behavioral of d_ff_r is
	component d_latch
		port(	d,clk : in std_logic;
				q,q_bar : out std_logic
				);
	end component;
	component mux_1
		port(i0,i1,s: in std_logic;
				o: out std_logic
				);
	end component;
	signal a,b,c,d,e,f,not_clk,r_clk,rn_clk: std_logic;
begin
	not_clk <= not clk;
	mux1: mux_1 port map(D_in,f,reset,c);
	latch_1: d_latch port map(c,rn_clk,a,b);
	mux3: mux_1 port map(clk,'1',reset,r_clk);
	latch_2: d_latch port map(a,r_clk,d,e);
	mux2: mux_1 port map(d,'0',reset,f);
	mux4: mux_1 port map(not_clk,'1',reset,rn_clk);
	q <= f;
	q_b <= not f;
end Behavioral;

