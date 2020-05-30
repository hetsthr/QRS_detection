----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:54:39 05/29/2020 
-- Design Name: 
-- Module Name:    buffer12_en - Behavioral 
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

entity buffer12_en is
	port(x:in std_logic_vector(11 downto 0); en:in std_logic; y: out std_logic_vector(11 downto 0));
end buffer12_en;

architecture Behavioral of buffer12_en is
begin

	y(0) <= x(0) and en ;
	y(1) <= x(1) and en ;
	y(2) <= x(2) and en ;
	y(3) <= x(3) and en ;
	y(4) <= x(4) and en ;
	y(5) <= x(5) and en ;
	y(6) <= x(6) and en ;
	y(7) <= x(7) and en ;
	y(8) <= x(8) and en ;
	y(9) <= x(9) and en ;
	y(10) <= x(10) and en ;
	y(11) <= x(11) and en ;

end Behavioral;

