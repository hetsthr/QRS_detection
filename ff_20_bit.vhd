----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:52:20 05/30/2020 
-- Design Name: 
-- Module Name:    ff_20_bit - Behavioral 
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

entity ff_20_bit is
	port(	D: in std_logic_vector(19 downto 0);
			clk: in std_logic;
			Q: out std_logic_vector(19 downto 0)
			);
end ff_20_bit;

architecture Behavioral of ff_20_bit is
	component d_ff
		port(	D:IN STD_LOGIC;
				CLK:IN STD_LOGIC; 
				Q:OUT STD_LOGIC
				);
	end component;
begin
	DFF_0: d_ff port map(D(0),clk,Q(0));
	DFF_1: d_ff port map(D(1),clk,Q(1));
	DFF_2: d_ff port map(D(2),clk,Q(2));
	DFF_3: d_ff port map(D(3),clk,Q(3));
	DFF_4: d_ff port map(D(4),clk,Q(4));
	DFF_5: d_ff port map(D(5),clk,Q(5));
	DFF_6: d_ff port map(D(6),clk,Q(6));
	DFF_7: d_ff port map(D(7),clk,Q(7));
	DFF_8: d_ff port map(D(8),clk,Q(8));
	DFF_9: d_ff port map(D(9),clk,Q(9));
	DFF_10: d_ff port map(D(10),clk,Q(10));
	DFF_11: d_ff port map(D(12),clk,Q(11));
	DFF_12: d_ff port map(D(12),clk,Q(12));
	DFF_13: d_ff port map(D(13),clk,Q(13));
	DFF_14: d_ff port map(D(14),clk,Q(14));
	DFF_15: d_ff port map(D(15),clk,Q(15));
	DFF_16: d_ff port map(D(16),clk,Q(16));
	DFF_17: d_ff port map(D(17),clk,Q(17));
	DFF_18: d_ff port map(D(18),clk,Q(18));
	DFF_19: d_ff port map(D(19),clk,Q(19));
end Behavioral;

