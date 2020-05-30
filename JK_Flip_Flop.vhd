----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:32:21 05/25/2020 
-- Design Name: 
-- Module Name:    JK_Flip_Flop - Behavioral 
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

entity JK_Flip_Flop is
	port(J,K,CLK,Set,Reset : in std_logic;
	Q,Q_bar: out std_logic);
end JK_Flip_Flop;

architecture Behavioral of JK_Flip_Flop is
component D_Flip_Flop is
	port (D,CLK,S,R:IN STD_LOGIC; Q,Q_BAR:OUT STD_LOGIC);
end component;
component not_1 is
	port (x:in std_logic; y:out std_logic);
end component;
component nand_1 is
	port (x,y:in std_logic; z:out std_logic);
end component;
component buffer_1
	port(x:in std_logic; y:out std_logic);
end component;
signal P : std_logic_vector(5 downto 0);

begin

	BUF1: buffer_1 port map(P(4),Q);
	BUF2: buffer_1 port map(P(5),Q_bar);
	N1:not_1 port map(K,P(0));
	N2:nand_1 port map(P(4),P(0),P(1));
	N3:nand_1 port map(J,P(5),P(2));
	N4:nand_1 port map(P(2),P(1),P(3));
	DFF1 : D_Flip_Flop port map(P(3),CLK,Set,Reset,P(4),P(5));


end Behavioral;

