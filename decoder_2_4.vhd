----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:51:18 05/28/2020 
-- Design Name: 
-- Module Name:    decoder_2_4 - Behavioral 
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

entity decoder_2_4 is
	port(	a: in std_logic_vector(1 downto 0);
			en: in std_logic;
			d_out: out std_logic_vector(3 downto 0)
			);
end decoder_2_4;

architecture Behavioral of decoder_2_4 is
begin
	d_out(0) <= (not a(0)) and (not a(1)) and en;
	d_out(1) <= a(0) and (not a(1)) and en;
	d_out(2) <= (not a(0)) and a(1) and en;
	d_out(3) <= a(0) and a(1) and en;
end Behavioral;

