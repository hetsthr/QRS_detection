----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:20:29 05/29/2020 
-- Design Name: 
-- Module Name:    counter_72 - Behavioral 
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

entity counter_72 is
	port(	clk,clr: in std_logic;
			done: out std_logic;
			count: out std_logic_vector(9 downto 0)
			);
end counter_72;

architecture Behavioral of counter_72 is
component Adder_16
		port(	A,B:in std_logic_vector(15 downto 0); 
			Cin:in std_logic; 
			Sum:out std_logic_vector(15 downto 0); 
			carry:out std_logic
			); 
	end component;
	component sync_d_ff_r
		port(	clk,reset,D_in: in std_logic;
				q,q_b: out std_logic
				);
	end component;
	signal reset: std_logic;
	signal q,qb: std_logic_vector (9 downto 0);
	signal add_in,add_out: std_logic_vector (15 downto 0);
begin
	ff0: sync_d_ff_r port map(clk,reset,add_out(0),q(0),qb(0));
	ff1: sync_d_ff_r port map(clk,reset,add_out(1),q(1),qb(1));
	ff2: sync_d_ff_r port map(clk,reset,add_out(2),q(2),qb(2));
	ff3: sync_d_ff_r port map(clk,reset,add_out(3),q(3),qb(3));
	ff4: sync_d_ff_r port map(clk,reset,add_out(4),q(4),qb(4));
	ff5: sync_d_ff_r port map(clk,reset,add_out(5),q(5),qb(5));
	ff6: sync_d_ff_r port map(clk,reset,add_out(6),q(6),qb(6));
	ff7: sync_d_ff_r port map(clk,reset,add_out(7),q(7),qb(7));
	ff8: sync_d_ff_r port map(clk,reset,add_out(8),q(8),qb(8));
	ff9: sync_d_ff_r port map(clk,reset,add_out(9),q(9),qb(9));
	add_in <= "000000" & q;
	adder: Adder_16 port map(add_in,"0000000000000001",'0',add_out);
	count <= q;
	done <= q(3) and q(6);
	reset <= (not clr) and (not (add_out(3) and add_out(6) and add_out(0)));
end Behavioral;

