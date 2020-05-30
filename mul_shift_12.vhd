----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:14:53 05/29/2020 
-- Design Name: 
-- Module Name:    mul_shift_12 - Behavioral 
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

entity mul_shift_12 is
port(x:in std_logic_vector(11 downto 0); y:out std_logic_vector(11 downto 0));
end mul_shift_12;

architecture Behavioral of mul_shift_12 is
component buffer_1
	port(x:in std_logic; y:out std_logic);
end component;
begin

	BUFF01: buffer_1 port map(x(3),y(0));
	BUFF02: buffer_1 port map(x(4),y(1));
	BUFF03: buffer_1 port map(x(5),y(2));
	BUF1: buffer_1 port map(x(6),y(3));
	BUF2: buffer_1 port map(x(7),y(4));
	BUF3: buffer_1 port map(x(8),y(5));
	BUF4: buffer_1 port map(x(9),y(6));
	BUF5: buffer_1 port map(x(10),y(7));
	BUF6: buffer_1 port map(x(11),y(8));
	BUF7: buffer_1 port map('0',y(9));
	BUF8: buffer_1 port map('0',y(10));
	BUF9: buffer_1 port map('0',y(11));

end Behavioral;

