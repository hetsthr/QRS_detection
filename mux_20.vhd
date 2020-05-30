----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:35:41 05/28/2020 
-- Design Name: 
-- Module Name:    mux_20 - Behavioral 
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

entity mux_20 is
	port(	i0,i1: in std_logic_vector (19 downto 0);
			s: in std_logic;
			o: out std_logic_vector (19 downto 0)
			);
end mux_20;

architecture Behavioral of mux_20 is
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
	M9: mux_1 port map(i0(8),i1(8),s,o(8));
	M10: mux_1 port map(i0(9),i1(9),s,o(9));
	M11: mux_1 port map(i0(10),i1(10),s,o(10));
	M12: mux_1 port map(i0(11),i1(11),s,o(11));
	M13: mux_1 port map(i0(12),i1(12),s,o(12));
	M14: mux_1 port map(i0(13),i1(13),s,o(13));
	M15: mux_1 port map(i0(14),i1(14),s,o(14));
	M16: mux_1 port map(i0(15),i1(15),s,o(15));
	M17: mux_1 port map(i0(16),i1(16),s,o(16));
	M18: mux_1 port map(i0(17),i1(17),s,o(17));
	M19: mux_1 port map(i0(18),i1(18),s,o(18));
	M20: mux_1 port map(i0(19),i1(19),s,o(19));
end Behavioral;

