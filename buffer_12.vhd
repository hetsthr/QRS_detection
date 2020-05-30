----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:26:38 05/28/2020 
-- Design Name: 
-- Module Name:    buffer_12 - Behavioral 
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

entity buffer_12 is
	port (x:in std_logic_vector(11 downto 0); y:out std_logic_vector(11 downto 0));
end buffer_12;

architecture Behavioral of buffer_12 is
component buffer_1
	port(x:in std_logic; y:out std_logic);
end component;
begin

	BUF0: buffer_1 port map(x(0),y(0));
	BUF1: buffer_1 port map(x(1),y(1));
	BUF2: buffer_1 port map(x(2),y(2));
	BUF3: buffer_1 port map(x(3),y(3));
	BUF4: buffer_1 port map(x(4),y(4));
	BUF5: buffer_1 port map(x(5),y(5));
	BUF6: buffer_1 port map(x(6),y(6));
	BUF7: buffer_1 port map(x(7),y(7));
	BUF8: buffer_1 port map(x(8),y(8));
	BUF9: buffer_1 port map(x(9),y(9));
	BUF10: buffer_1 port map(x(10),y(10));
	BUF11: buffer_1 port map(x(11),y(11));
	

end Behavioral;

