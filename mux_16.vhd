----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:08:17 05/14/2020 
-- Design Name: 
-- Module Name:    mux_16 - Behavioral 
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

entity mux_16 is
	port(	i0,i1: in std_logic_vector (15 downto 0);
			s: in std_logic;
			o: out std_logic_vector (15 downto 0)
			);
end mux_16;

architecture Behavioral of mux_16 is
	component mux_8
		port(	i0,i1: in std_logic_vector (7 downto 0);
				s: in std_logic;
				o: out std_logic_vector (7 downto 0)
				);
	end component;
begin
	M1: mux_8 port map(i0(7 downto 0),i1(7 downto 0),s,o(7 downto 0));
	M2: mux_8 port map(i0(15 downto 8),i1(15 downto 8),s,o(15 downto 8));
end Behavioral;

