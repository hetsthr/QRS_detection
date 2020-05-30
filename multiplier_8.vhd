----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:54:06 05/13/2020 
-- Design Name: 
-- Module Name:    multiplier_8 - Behavioral 
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

entity multiplier_8 is
	port(	a,b: in std_logic_vector (7 downto 0);
			p: out std_logic_vector (15 downto 0)
			);
end multiplier_8;

architecture Behavioral of multiplier_8 is
	type vedic_4 is array (0 to 3) of std_logic_vector(7 downto 0);
	component multiplier_4
	port(	a,b: in std_logic_vector (3 downto 0);
			res: out std_logic_vector (7 downto 0)			
			);
	end component;
	
	component adder1
		port(	a,b: in std_logic_vector (7 downto 0);
				sum: out std_logic_vector (7 downto 0);
				carry: out std_logic
				);
	end component;
	
	component adder2
		port(	a: in std_logic_vector (7 downto 0);
				b: in std_logic_vector (3 downto 0);
				sum: out std_logic_vector (7 downto 0);
				carry: out std_logic
				);
	end component;
	
	component adder3
		port(	a: in std_logic_vector (7 downto 0);
				b: in std_logic_vector (4 downto 0);
				sum: out std_logic_vector (7 downto 0);
				carry: out std_logic
				);
	end component;
	signal product: vedic_4;
	signal s1,s2: std_logic_vector (7 downto 0);
	signal c1,c2,c3: std_logic;
	signal concat: std_logic_vector (4 downto 0);
begin
	concat <= c1 & s2(7 downto 4);
	VEDIC4_1: multiplier_4 port map(a(3 downto 0),b(3 downto 0),product(0));
	VEDIC4_2: multiplier_4 port map(a(7 downto 4),b(3 downto 0),product(1));
	VEDIC4_3: multiplier_4 port map(a(3 downto 0),b(7 downto 4),product(2));
	VEDIC4_4: multiplier_4 port map(a(7 downto 4),b(7 downto 4),product(3));
	ADDER_1: adder1 port map(product(1),product(2),s1,c1);
	ADDER_2: adder2 port map(s1,product(0)(7 downto 4),s2,c2);
	ADDER_3: adder3 port map(product(3),concat,p(15 downto 8),c3);
	p(7 downto 4) <= s2(3 downto 0);
	p(3 downto 0) <= product(0)(3 downto 0);
end Behavioral;

