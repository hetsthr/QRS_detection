----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:43:35 05/14/2020 
-- Design Name: 
-- Module Name:    mux_1 - Behavioral 
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

entity mux_1 is
	port(	i0,i1,s: in std_logic;
			o: out std_logic
			);
end mux_1;

architecture Behavioral of mux_1 is
	signal s_not: std_logic;
begin
	s_not <= not s;
	o <= (s_not and i0) or (s and i1);
end Behavioral;

