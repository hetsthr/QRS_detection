----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:22:25 05/17/2020 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter is
	port(	clk,clr: in std_logic;
			done: out std_logic;
			count: out std_logic_vector (9 downto 0)
		);
end counter;

architecture Behavioral of counter is
	component d_ff_r
		port( D_in,clk,reset: in std_logic;
				q,q_b: out std_logic
				);
	end component;
	component mux_1
		port(i0,i1,s: in std_logic;
				o: out std_logic
				);
	end component;
	signal q,qb,a,b: std_logic_vector (9 downto 0);
	signal reset: std_logic;

begin
	reset <= not clr;
	ff1: d_ff_r port map (qb(4),clk,reset,q(0),qb(0));
	ff2: d_ff_r port map (q(0),clk,reset,q(1),qb(1));
	b(0) <= qb(2) and qb(0);
	a(1) <= qb(1) nor b(0);
	ff3: d_ff_r port map (a(1),clk,reset,q(2),qb(2));
	ff4: d_ff_r port map (q(2),clk,reset,q(3),qb(3));
	ff5: d_ff_r port map (q(3),clk,reset,q(4),qb(4));
	count(0) <= qb(4) and qb(0);
	count(1) <= q(0) and qb(1);
	count(2) <= q(1) and qb(2);
	count(3) <= qb(3) and q(2);
	count(4) <= qb(4) and q(3);
	count(5) <= q(0) and q(4);
	count(6) <= qb(0) and q(1);
	count(7) <= qb(1) and q(2);
	count(8) <= qb(2) and q(3);
	count(9) <= qb(3) and q(4);
end Behavioral;




--begin
--	ff1: d_ff_r port map (temp_qb(0),clk,reset,temp_q(0),temp_qb(0));
--	mux1: mux_1 port map (temp_qb(0),clk,clr,r_q(0));
--	ff2: d_ff_r port map (temp_qb(1),r_q(0),reset,temp_q(1),temp_qb(1));
--	mux2: mux_1 port map (temp_qb(1),clk,clr,r_q(1));
--	ff3: d_ff_r port map (temp_qb(2),r_q(1),reset,temp_q(2),temp_qb(2));
--	mux3: mux_1 port map (temp_qb(2),clk,clr,r_q(2));
--	ff4: d_ff_r port map (temp_qb(3),r_q(2),reset,temp_q(3),temp_qb(3));
--	mux4: mux_1 port map (temp_qb(3),clk,clr,r_q(3));
--	ff5: d_ff_r port map (temp_qb(4),r_q(3),reset,temp_q(4),temp_qb(4));
--	mux5: mux_1 port map (temp_qb(4),clk,clr,r_q(4));
--	ff6: d_ff_r port map (temp_qb(5),r_q(4),reset,temp_q(5),temp_qb(5));
--	mux6: mux_1 port map (temp_qb(5),clk,clr,r_q(5));
--	ff7: d_ff_r port map (temp_qb(6),r_q(5),reset,temp_q(6),temp_qb(6));
--	mux7: mux_1 port map (temp_qb(6),clk,clr,r_q(6));
--	ff8: d_ff_r port map (temp_qb(7),r_q(6),reset,temp_q(7),temp_qb(7));
--	mux8: mux_1 port map (temp_qb(7),clk,clr,r_q(7));
--	ff9: d_ff_r port map (temp_qb(8),r_q(7),reset,temp_q(8),temp_qb(8));
--	mux9: mux_1 port map (temp_qb(8),clk,clr,r_q(8));
--	ff10: d_ff_r port map (temp_qb(9),r_q(8),reset,temp_q(9),temp_qb(9));
--	count <= temp_q;
--	reset <= (not clr) and (not (temp_q(4) and temp_q(6) and temp_q(7) and temp_q(9)));
--end Behavioral;