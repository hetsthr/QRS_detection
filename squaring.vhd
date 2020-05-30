----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:00:31 05/27/2020 
-- Design Name: 
-- Module Name:    squaring - Behavioral 
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

entity squaring is
	port(	a: in std_logic_vector(7 downto 0);
			s: out std_logic_vector(7 downto 0)
			);
end squaring;

architecture Behavioral of squaring is
	component signed_multiplier
		port( a,b: in std_logic_vector(7 downto 0);
				p: out std_logic_vector (15 downto 0)
				);
	end component;
	signal temp_out: std_logic_vector (15 downto 0);
begin
	multiplier1: signed_multiplier port map(a,a,temp_out);
	s <= temp_out(13 downto 6);
end Behavioral;

