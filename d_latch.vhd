----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:34:40 05/07/2020 
-- Design Name: 
-- Module Name:    d_latch - Behavioral 
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

entity d_latch is
	port(	d,clk : in std_logic;
			q,q_bar : out std_logic
			);
end d_latch;

architecture Behavioral of d_latch is
	signal s1,s2,s3,s4,d_bar : std_logic;
	component nand_gate
		port(a,b: in std_logic;
				c: out std_logic);
	end component;
begin
s1 <= d nand clk;
s2 <= d_bar nand clk;
s4 <= s1 nand s3;
s3 <= s2 nand s4;
q <= s4;
q_bar <= s3;
d_bar <= not d;
end Behavioral;

