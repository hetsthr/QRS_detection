----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:43:48 05/29/2020 
-- Design Name: 
-- Module Name:    buffer_16 - Behavioral 
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

entity buffer_16 is
port(x:in std_logic_vector(15 downto 0); y:out std_logic_vector(15 downto 0));
end buffer_16;

architecture Behavioral of buffer_16 is
component buffer_8
	port(x:in std_logic_vector(7 downto 0); y:out std_logic_vector(7 downto 0));
end component;
begin

	BUF1: buffer_8 port map(x(7 downto 0),y(7 downto 0));
	BUF2: buffer_8 port map(x(15 downto 8),y(15 downto 8));

end Behavioral;

