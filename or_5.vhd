----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:04:12 05/15/2020 
-- Design Name: 
-- Module Name:    or_5 - Behavioral 
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

entity or_5 is
port(a,b,c,d,e:in std_logic; z:out std_logic);
end or_5;

architecture Behavioral of or_5 is
signal s1,s2,s3:std_logic;
begin
s1 <= a or b;
s2 <= c or d;
s3 <= s1 or e;
z <= s2 or s3;
end Behavioral;

