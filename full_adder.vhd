----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:26:13 05/13/2020 
-- Design Name: 
-- Module Name:    full_adder - Behavioral 
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

entity full_adder is
	port(	a,b,c_in: in std_logic;
			sum,c_out: out std_logic
			);
end full_adder;
architecture Behavioral of full_adder is
	signal s1,c1,c2: std_logic;
	component half_adder
		port(	a,b: in std_logic;
				s,c: out std_logic
				);
	end component;
begin
	HA1: half_adder port map(a,b,s1,c1);
	HA2: half_adder port map(c_in,s1,sum,c2);
	c_out <= c1 or c2;
end Behavioral;

