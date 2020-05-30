----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:52:56 05/13/2020 
-- Design Name: 
-- Module Name:    RCA6 - Behavioral 
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

entity RCA6 is
	port(	a,b: in std_logic_vector (5 downto 0);
			sum: out std_logic_vector (5 downto 0);
			c_out: out std_logic
			);
end RCA6;

architecture Behavioral of RCA6 is
	signal c1,c2,c3,c4,c5: std_logic;
	component full_adder
		port(	a,b,c_in: in std_logic;
				sum,c_out: out std_logic
				);
	end component;
	component half_adder
		port(	a,b : in std_logic;
				s,c : out std_logic
				);
	end component;
begin
	HA1: half_adder port map(a(0),b(0),sum(0),c1);
	FA1: full_adder port map(a(1),b(1),c1,sum(1),c2);
	FA2: full_adder port map(a(2),b(2),c2,sum(2),c3);
	FA3: full_adder port map(a(3),b(3),c3,sum(3),c4);
	FA4: full_adder port map(a(4),b(4),c4,sum(4),c5);
	FA5: full_adder port map(a(5),b(5),c5,sum(5),c_out);
end Behavioral;

