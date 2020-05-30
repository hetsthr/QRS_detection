----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:33:31 05/12/2020 
-- Design Name: 
-- Module Name:    multiplier_2 - Behavioral 
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

entity multiplier_2 is
	port(	a,b: in std_logic_vector(1 downto 0);
			m: out std_logic_vector(3 downto 0)
			);
end multiplier_2;

architecture Behavioral of multiplier_2 is
	signal s1,s2,s3,s4: std_logic;
	component half_adder
		port(	a,b: in std_logic;
				s,c: out std_logic
				);
	end component;
begin
m(0) <= a(0) and b(0);
s1 <= a(1) and b(1);
s2 <= a(0) and b(1);
s3 <= a(1) and b(0);
HA1 : half_adder port map(s2,s3,m(1),s4);
HA2 : half_adder port map(s4,s1,m(2),m(3));
end Behavioral;

