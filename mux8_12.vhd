----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:59:22 05/30/2020 
-- Design Name: 
-- Module Name:    mux8_12 - Behavioral 
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

entity mux8_12 is
	port(	a,b,c,d,e,f,g,h: in std_logic_vector (11 downto 0);
			s: in std_logic_vector(2 downto 0);
			o: out std_logic_vector (11 downto 0)
			);
end mux8_12;

architecture Behavioral of mux8_12 is

begin


end Behavioral;

