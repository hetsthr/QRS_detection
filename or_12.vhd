----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:59:14 05/30/2020 
-- Design Name: 
-- Module Name:    or_12 - Behavioral 
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

entity or_12 is
port(a,b:in std_logic_vector(11 downto 0);
out1:out std_logic_vector(11 downto 0));
end or_12;

architecture Behavioral of or_12 is
component or_1 is
port(a,b:in std_logic; out1:out std_logic);
end component;
signal p:std_logic_vector(11 downto 0);
begin
a1:or_1 port map(a(0),b(0),p(0));
a2:or_1 port map(a(1),b(1),p(1));
a3:or_1 port map(a(2),b(2),p(2));
a4:or_1 port map(a(3),b(3),p(3));
a5:or_1 port map(a(4),b(4),p(4));
a6:or_1 port map(a(5),b(5),p(5));
a7:or_1 port map(a(6),b(6),p(6));
a8:or_1 port map(a(7),b(7),p(7));
a9:or_1 port map(a(8),b(8),p(8));
a10:or_1 port map(a(9),b(9),p(9));
a11:or_1 port map(a(10),b(10),p(10));
a12:or_1 port map(a(11),b(11),p(11));
out1<=p;


end Behavioral;

