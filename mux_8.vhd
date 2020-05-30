----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:49:02 05/14/2020 
-- Design Name: 
-- Module Name:    mux_8 - Behavioral 
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

entity mux_8 is
	port(	i0,i1: in std_logic_vector (7 downto 0);
			s: in std_logic;
			o: out std_logic_vector (7 downto 0)
			);
end mux_8;

architecture Behavioral of mux_8 is
	component mux_1
		port(i0,i1,s: in std_logic;
			o: out std_logic
			);
	end component;
begin
	M1: mux_1 port map(i0(0),i1(0),s,o(0));
	M2: mux_1 port map(i0(1),i1(1),s,o(1));
	M3: mux_1 port map(i0(2),i1(2),s,o(2));
	M4: mux_1 port map(i0(3),i1(3),s,o(3));
	M5: mux_1 port map(i0(4),i1(4),s,o(4));
	M6: mux_1 port map(i0(5),i1(5),s,o(5));
	M7: mux_1 port map(i0(6),i1(6),s,o(6));
	M8: mux_1 port map(i0(7),i1(7),s,o(7));
end Behavioral;

