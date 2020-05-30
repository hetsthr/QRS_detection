----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:00:23 05/24/2020 
-- Design Name: 
-- Module Name:    signed_comparator - Behavioral 
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

entity signed_comparator is
	port(	a,b: in std_logic_vector(7 downto 0);
			z: out std_logic
			);
end signed_comparator;
architecture Behavioral of signed_comparator is
	component mux_1
		port(	i0,i1: in std_logic;
				s: in std_logic;
				o: out std_logic
				);
	end component;
	component comparator
		port(	a,b : in STD_LOGIC_VECTOR(7 downto 0);
				z: out STD_LOGIC
				);
	end component;
	signal c_out,res,sel: std_logic;
begin
	sel <= a(7) xor b(7);
	comparator1: comparator port map(a,b,c_out);
	res <= not c_out;
	mux1: mux_1 port map(c_out,res,sel,z);
end Behavioral;

