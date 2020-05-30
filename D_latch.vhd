----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:53:04 05/18/2020 
-- Design Name: 
-- Module Name:    D_latch - Behavioral 
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

entity D_latch is
port (D,CLK,Set,Reset:IN STD_LOGIC; Q,Q_BAR:OUT STD_LOGIC); 
end D_latch;

architecture Behavioral of D_latch is
component nand_1
	port (x,y:in std_logic; z:out std_logic);
end component;
component not_1
	port (x:in std_logic; y:out std_logic);
end component;
component buffer_1
	port (x:in std_logic; y:out std_logic);
end  component;
component nand_3
	port(a,b,c:in std_logic; z:out std_logic);
end component;
signal a,b,c,q1,q2:std_logic;
begin	
		NA1: nand_1 port map(D,CLK,a);
		N1 : not_1 port map(D,b);
		NA2: nand_1 port map(b,CLK,c);
		NA3: nand_3 port map(a,Set,q2,q1);
		NA4: nand_3 port map(c,Reset,q1,q2);
		BUF1: buffer_1 port map(q1,Q);
		BUF2: buffer_1 port map(q2,Q_BAR);
end Behavioral;

