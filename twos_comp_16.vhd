----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:01:00 05/14/2020 
-- Design Name: 
-- Module Name:    twos_comp_16 - Behavioral 
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

entity twos_comp_16 is
	port(	a: in std_logic_vector (15 downto 0);
			b: out std_logic_vector (15 downto 0)
			);
end twos_comp_16;

architecture Behavioral of twos_comp_16 is
	component half_adder 
		port(	a,b: in std_logic;
				s,c: out std_logic
				);
	end component;
	signal inverted : std_logic_vector(15 downto 0);
	signal x: std_logic_vector (15 downto 0);
begin
	inverted <= not a;
	HA1: half_adder port map(inverted(0),'1',b(0),x(0));
	HA2: half_adder port map(inverted(1),x(0),b(1),x(1));
	HA3: half_adder port map(inverted(2),x(1),b(2),x(2));
	HA4: half_adder port map(inverted(3),x(2),b(3),x(3));
	HA5: half_adder port map(inverted(4),x(3),b(4),x(4));
	HA6: half_adder port map(inverted(5),x(4),b(5),x(5));
	HA7: half_adder port map(inverted(6),x(5),b(6),x(6));
	HA8: half_adder port map(inverted(7),x(6),b(7),x(7));
	HA9: half_adder port map(inverted(8),x(7),b(8),x(8));
	HA10: half_adder port map(inverted(9),x(8),b(9),x(9));
	HA11: half_adder port map(inverted(10),x(9),b(10),x(10));
	HA12: half_adder port map(inverted(11),x(10),b(11),x(11));
	HA13: half_adder port map(inverted(12),x(11),b(12),x(12));
	HA14: half_adder port map(inverted(13),x(12),b(13),x(13));
	HA15: half_adder port map(inverted(14),x(13),b(14),x(14));
	HA16: half_adder port map(inverted(15),x(14),b(15),x(15));
end Behavioral;

