----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:43:59 05/22/2020 
-- Design Name: 
-- Module Name:    JKflipflop - Behavioral 
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

entity JKflipflop is
port(j,k,clk,clear_bar,preset_bar:in std_logic;
q:out std_logic);
end JKflipflop;

architecture Behavioral of JKflipflop is
component nandfile is
port(a,b:in std_logic;
out1:out std_logic);
end component;
component notfile is
port(in1:in std_logic;
out1:out std_logic);
end component;
component nand_3 is
port(a,b,c:in std_logic; z:out std_logic); 
end component;

signal temp1,temp2,temp3,temp4,temp5,temp6,temp7,temp8,temp9,temp10:std_logic;
signal clkbar:std_logic;
begin

first:notfile port map(clk,clkbar);
second:nand_3 port map(j,clk,temp8,temp1);
fourth:nand_3 port map(temp1,temp6,preset_bar,temp2);
fifth:nandfile port map(temp2,clkbar,temp3);
sixth:nandfile port map(temp3,preset_bar,temp4);

eigth:nand_3 port map(k,clkbar,temp4,temp5);
ninth:nand_3 port map(temp5,clear_bar,temp2,temp6);
tenth:nandfile port map(temp6,clkbar,temp7);
eleventh:nandfile port map(temp7,clear_bar,temp8);
q<=temp4;


end Behavioral;

