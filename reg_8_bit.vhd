----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:42:59 05/24/2020 
-- Design Name: 
-- Module Name:    reg_8_bit - Behavioral 
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

entity reg_8_bit is
	port(	data_in: in std_logic_vector(7 downto 0);
			clk,clr,w_en: in std_logic;
			data_out: out std_logic_vector(7 downto 0)
			);
end reg_8_bit;

architecture Behavioral of reg_8_bit is
	component d_ff_r
		port(	clk,reset,D_in: in std_logic;
				q,q_b: out std_logic
				);
	end component;
	component mux_8
		port(	i0,i1: in std_logic_vector (7 downto 0);
				s: in std_logic;
				o: out std_logic_vector (7 downto 0)
				);
	end component;
	signal d_in,d_out: std_logic_vector(7 downto 0);
begin
	mux: mux_8 port map(d_out,data_in,w_en,d_in);
	FF1: d_ff_r port map(clk,clr,d_in(0),d_out(0));
	FF2: d_ff_r port map(clk,clr,d_in(1),d_out(1));
	FF3: d_ff_r port map(clk,clr,d_in(2),d_out(2));
	FF4: d_ff_r port map(clk,clr,d_in(3),d_out(3));
	FF5: d_ff_r port map(clk,clr,d_in(4),d_out(4));
	FF6: d_ff_r port map(clk,clr,d_in(5),d_out(5));
	FF7: d_ff_r port map(clk,clr,d_in(6),d_out(6));
	FF8: d_ff_r port map(clk,clr,d_in(7),d_out(7));
	data_out <= d_out;
end Behavioral;

