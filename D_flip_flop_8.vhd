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

entity D_flip_flop_8 is
port (D:in std_logic_vector(7 downto 0);CLK,S,R:in std_logic;Q,Q_bar:out std_logic_vector(7 downto 0)); 
end D_flip_flop_8;

architecture Behavioral of D_flip_flop_8 is
component D_Flip_Flop
	port (D,CLK,S,R:IN STD_LOGIC; Q,Q_BAR:OUT STD_LOGIC);  
end component;
begin
	DFF_0: D_Flip_Flop port map(D(0),CLK,S,R,Q(0),Q_bar(0));
	DFF_1: D_Flip_Flop port map(D(1),CLK,S,R,Q(1),Q_bar(1));
	DFF_2: D_Flip_Flop port map(D(2),CLK,S,R,Q(2),Q_bar(2));
	DFF_3: D_Flip_Flop port map(D(3),CLK,S,R,Q(3),Q_bar(3));
	DFF_4: D_Flip_Flop port map(D(4),CLK,S,R,Q(4),Q_bar(4));
	DFF_5: D_Flip_Flop port map(D(5),CLK,S,R,Q(5),Q_bar(5));
	DFF_6: D_Flip_Flop port map(D(6),CLK,S,R,Q(6),Q_bar(6));
	DFF_7: D_Flip_Flop port map(D(7),CLK,S,R,Q(7),Q_bar(7));
end Behavioral;

