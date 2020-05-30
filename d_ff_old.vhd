----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:14:25 05/30/2020 
-- Design Name: 
-- Module Name:    d_ff_old - Behavioral 
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
entity d_ff_old is
port(	D:IN STD_LOGIC;
		CLK:IN STD_LOGIC; 
		Q:OUT STD_LOGIC
		); 
end d_ff_old;

architecture Behavioral of d_ff_old is
component nand_1
	port (x,y:in std_logic; z:out std_logic);
end component;
component not_1
	port (x:in std_logic; y:out std_logic);
end component;
component buffer_1
	port (x:in std_logic; y:out std_logic);
end  component;
signal a,b,c,q1,q2:std_logic;
begin	
		NA1: nand_1 port map(D,CLK,a);
		N1 : not_1 port map(D,b);		
		NA2: nand_1 port map(b,CLK,c);
		NA3: nand_1 port map(a,q2,q1);
		NA4: nand_1 port map(c,q1,q2);
		Q <= q1;
end Behavioral;