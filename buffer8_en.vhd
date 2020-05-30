----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:37:29 05/27/2020 
-- Design Name: 
-- Module Name:    buffer8_en - Behavioral 
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

entity buffer8_en is
	port(x:in std_logic_vector(7 downto 0); en:in std_logic; y: out std_logic_vector(7 downto 0));
end buffer8_en;

architecture Behavioral of buffer8_en is

begin
	y(0) <= x(0) and en ;
	y(1) <= x(1) and en ;
	y(2) <= x(2) and en ;
	y(3) <= x(3) and en ;
	y(4) <= x(4) and en ;
	y(5) <= x(5) and en ;
	y(6) <= x(6) and en ;
	y(7) <= x(7) and en ;
end Behavioral;

