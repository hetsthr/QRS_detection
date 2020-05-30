----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:55:06 05/13/2020 
-- Design Name: 
-- Module Name:    twos_comp - Behavioral 
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

entity twos_comp is
	port(	a: in std_logic_vector (7 downto 0);
			b: out std_logic_vector (7 downto 0)
			);
end twos_comp;

architecture Behavioral of twos_comp is
	component half_adder 
		port(	a,b: in std_logic;
				s,c: out std_logic
				);
	end component;
	signal inverted : std_logic_vector(7 downto 0);
	signal x0,x1,x2,x3,x4,x5,x6,x7: std_logic;
begin
	inverted <= not a;
	HA1: half_adder port map(inverted(0),'1',b(0),x0);
	HA2: half_adder port map(inverted(1),x0,b(1),x1);
	HA3: half_adder port map(inverted(2),x1,b(2),x2);
	HA4: half_adder port map(inverted(3),x2,b(3),x3);
	HA5: half_adder port map(inverted(4),x3,b(4),x4);
	HA6: half_adder port map(inverted(5),x4,b(5),x5);
	HA7: half_adder port map(inverted(6),x5,b(6),x6);
	HA8: half_adder port map(inverted(7),x6,b(7),x7);
end Behavioral;

