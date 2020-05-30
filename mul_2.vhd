----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:24:40 05/29/2020 
-- Design Name: 
-- Module Name:    mul_2 - Behavioral 
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

entity mul_2 is
	port(a,b:in std_logic_vector(1 downto 0); z:out std_logic_vector(3 downto 0));
end mul_2;

architecture Behavioral of mul_2 is
component and_1
	port(x,y:in std_logic; z:out std_logic);
end component;
component half_adder
	port(	a,b : in std_logic;
			s,c : out std_logic
			);
end component;
begin

	A1: and_1 port map(a(0),b(0),z(0));
	A2: and_1 port map(a(1),b(1)

end Behavioral;

