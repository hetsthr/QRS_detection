----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:25:27 05/29/2020 
-- Design Name: 
-- Module Name:    not_12 - Behavioral 
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

entity not_12 is
port(x:in std_logic_vector(11 downto 0); y:out std_logic_vector(11 downto 0));
end not_12;

architecture Behavioral of not_12 is
component not_1
port (x:in std_logic; y:out std_logic);
end component;
begin

	N1: not_1 port map(x(0),y(0));
	N2: not_1 port map(x(1),y(1));
	N3: not_1 port map(x(2),y(2));
	N4: not_1 port map(x(3),y(3));
	N5: not_1 port map(x(4),y(4));
	N6: not_1 port map(x(5),y(5));
	N7: not_1 port map(x(6),y(6));
	N8: not_1 port map(x(7),y(7));
	N9: not_1 port map(x(8),y(8));
	N10: not_1 port map(x(9),y(9));
	N11: not_1 port map(x(10),y(10));
	N12: not_1 port map(x(11),y(11));

end Behavioral;

