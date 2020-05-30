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
	signal temp_q,temp_qb: std_logic_vector (9 downto 0);
	signal reset,stop,gated_clk: std_logic;
begin
	ff1: d_ff_r port map (temp_qb(0),gated_clk,reset,temp_q(0),temp_qb(0));
	ff2: d_ff_r port map (temp_qb(1),temp_qb(0),reset,temp_q(1),temp_qb(1));
	ff3: d_ff_r port map (temp_qb(2),temp_qb(1),reset,temp_q(2),temp_qb(2));
	ff4: d_ff_r port map (temp_qb(3),temp_qb(2),reset,temp_q(3),temp_qb(3));
	ff5: d_ff_r port map (temp_qb(4),temp_qb(3),reset,temp_q(4),temp_qb(4));
	ff6: d_ff_r port map (temp_qb(5),temp_qb(4),reset,temp_q(5),temp_qb(5));
	ff7: d_ff_r port map (temp_qb(6),temp_qb(5),reset,temp_q(6),temp_qb(6));
	ff8: d_ff_r port map (temp_qb(7),temp_qb(6),reset,temp_q(7),temp_qb(7));
	ff9: d_ff_r port map (temp_qb(8),temp_qb(7),reset,temp_q(8),temp_qb(8));
	ff10: d_ff_r port map (temp_qb(9),temp_qb(8),reset,temp_q(9),temp_qb(9));
	count <= temp_q;
	reset <= clr;
	mux1: mux_1 port map(clk,'0',stop,gated_clk);
	stop <= temp_q(4) and temp_q(6) and temp_q(7) and temp_q(9);
	done <= stop;
end Behavioral;