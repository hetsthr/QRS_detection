----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:49:03 05/28/2020 
-- Design Name: 
-- Module Name:    mux_8x1 - Behavioral 
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

entity mux_8x1 is
	port(	i: in std_logic_vector(7 downto 0);
			s: in std_logic_vector(2 downto 0);
			o: out std_logic
			);
end mux_8x1;

architecture Behavioral of mux_8x1 is
	component mux_1
		port(	i0,i1: in std_logic;
				s: in std_logic;
				o: out std_logic
				);
	end component;
	type mux_out is array (0 to 5) of std_logic;
	signal temp: mux_out;
begin
	mux1: mux_1 port map(i(0),i(1),s(0),temp(0));
	mux2: mux_1 port map(i(2),i(3),s(0),temp(1));
	mux3: mux_1 port map(i(4),i(5),s(0),temp(2));
	mux4: mux_1 port map(i(6),i(7),s(0),temp(3));
	mux5: mux_1 port map(temp(0),temp(1),s(1),temp(4));
	mux6: mux_1 port map(temp(2),temp(3),s(1),temp(5));
	mux7: mux_1 port map(temp(4),temp(5),s(2),o);
end Behavioral;
