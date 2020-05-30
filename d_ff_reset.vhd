----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:37:50 05/16/2020 
-- Design Name: 
-- Module Name:    d_ff_reset - Behavioral 
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

entity d_ff_reset is
	port( D: in std_logic_vector(7 downto 0);
			clk,reset: in std_logic;
			Q,Q_bar: out std_logic_vector (7 downto 0)
			);
end d_ff_reset;

architecture Behavioral of d_ff_reset is
	component mux_8
		port(	i0,i1: in std_logic_vector (7 downto 0);
			s: in std_logic;
			o: out std_logic_vector (7 downto 0)
			);
	end component;
	
	component buff_8
		port(	i: in std_logic_vector (7 downto 0);
				o: out std_logic_vector (7 downto 0)
			);
	end component;
	
	signal s0,s1,s2,s3: std_logic_vector (7 downto 0);
begin
	mux1: mux_8 port map(D,s1,clk,s0);
	mux2: mux_8 port map(s3,s0,clk,s2);
	buff1: buff_8 port map(s0,s1);
	mux3: mux_8 port map(s2,"00000000",reset,s3);
	buff2: buff_8 port map(s2,Q);
	Q_bar <= not s2;
end Behavioral;

