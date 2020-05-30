----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:21:14 05/14/2020 
-- Design Name: 
-- Module Name:    RCA_8 - Behavioral 
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

entity RCA_8 is
	port(	a,b: in std_logic_vector (7 downto 0);
			s: out std_logic_vector (7 downto 0);
			c: out std_logic
			);
end RCA_8;

architecture Behavioral of RCA_8 is
	component half_adder
		port(	a,b: in std_logic;
				s,c: out std_logic
				);
	end component;
	component full_adder
		port(	a,b,c_in: in std_logic;
				sum,c_out: out std_logic
				);
	end component;
	signal c_temp: std_logic_vector (7 downto 0);
begin
	HA1: half_adder port map(a(0),b(0),s(0),c_temp(0));
	FA1: full_adder port map(a(1),b(1),c_temp(0),s(1),c_temp(1));
	FA2: full_adder port map(a(2),b(2),c_temp(1),s(2),c_temp(2));
	FA3: full_adder port map(a(3),b(3),c_temp(2),s(3),c_temp(3));
	FA4: full_adder port map(a(4),b(4),c_temp(3),s(4),c_temp(4));
	FA5: full_adder port map(a(5),b(5),c_temp(4),s(5),c_temp(5));
	FA6: full_adder port map(a(6),b(6),c_temp(5),s(6),c_temp(6));
	FA7: full_adder port map(a(7),b(7),c_temp(6),s(7),c);
	
end Behavioral;

