----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:25:54 05/28/2020 
-- Design Name: 
-- Module Name:    mux_8x1_20 - Behavioral 
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

entity mux_8x1_20 is
	port(	i0,i1,i2,i3,i4,i5,i6,i7: in std_logic_vector(19 downto 0);
			s: in std_logic_vector(2 downto 0);
			o: out std_logic_vector(19 downto 0)
			);
end mux_8x1_20;

architecture Behavioral of mux_8x1_20 is
	component mux_20
		port(	i0,i1: in std_logic_vector (19 downto 0);
				s: in std_logic;
				o: out std_logic_vector (19 downto 0)
				);
	end component;
	type mux_out is array(0 to 5) of std_logic_vector(19 downto 0);
	signal temp: mux_out;
begin
	M1: mux_20 port map(i0,i1,s(0),temp(0));
	M2: mux_20 port map(i2,i3,s(0),temp(1));
	M3: mux_20 port map(i4,i5,s(0),temp(2));
	M4: mux_20 port map(i6,i7,s(0),temp(3));
	
	M5: mux_20 port map(temp(0),temp(1),s(1),temp(4));
	M6: mux_20 port map(temp(2),temp(3),s(1),temp(5));
	
	M7: mux_20 port map(temp(4),temp(5),s(2),o);
end Behavioral;

