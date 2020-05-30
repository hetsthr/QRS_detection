----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:11:33 05/13/2020 
-- Design Name: 
-- Module Name:    dflipflop - Behavioral 
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

entity dflipflop is
port(d,clk:in std_logic;
q,qbar:inout std_logic);
end dflipflop;

architecture Behavioral of dflipflop is
signal temp1,temp2,temp3:std_logic;

begin
temp1<=not(d);
temp2<=not (d and clk);
temp3<=not (temp1 and clk);
q<=not (temp2 and qbar);
qbar<=not (temp3 and q);
end Behavioral;

