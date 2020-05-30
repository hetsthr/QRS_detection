----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:17:19 05/07/2020 
-- Design Name: 
-- Module Name:    ff_8_bit - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:49:47 05/13/2020 
-- Design Name: 
-- Module Name:    D_flip_flop_8 - Behavioral 
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
entity ff_8_bit is
	port(	D: in std_logic_vector(7 downto 0);
			clk: in std_logic;
			Q: out std_logic_vector(7 downto 0)
			);
end ff_8_bit;

architecture Behavioral of ff_8_bit is
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
end Behavioral;

