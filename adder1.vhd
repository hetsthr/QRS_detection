----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:57:52 05/13/2020 
-- Design Name: 
-- Module Name:    adder1 - Behavioral 
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

entity adder1 is
	port(	a,b: in std_logic_vector (7 downto 0);
			sum: out std_logic_vector (7 downto 0);
			carry: out std_logic
			);
end adder1;

architecture Behavioral of adder1 is
	component half_adder
		port(	a,b : in std_logic;
				s,c : out std_logic
				);
	end component;
	
	component full_adder
	port(	a,b,c_in: in std_logic;
			sum,c_out: out std_logic
			);
	end component;
	signal c: std_logic_vector (6 downto 0);
begin
	HA1: half_adder port map(a(0),b(0),sum(0),c(0));
	FA1: full_adder port map(a(1),b(1),c(0),sum(1),c(1));
	FA2: full_adder port map(a(2),b(2),c(1),sum(2),c(2));
	FA3: full_adder port map(a(3),b(3),c(2),sum(3),c(3));
	FA4: full_adder port map(a(4),b(4),c(3),sum(4),c(4));
	FA5: full_adder port map(a(5),b(5),c(4),sum(5),c(5));
	FA6: full_adder port map(a(6),b(6),c(5),sum(6),c(6));
	FA7: full_adder port map(a(7),b(7),c(6),sum(7),carry);
end Behavioral;

