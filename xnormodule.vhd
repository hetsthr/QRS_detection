----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:41:56 05/19/2020 
-- Design Name: 
-- Module Name:    xnormodule - Behavioral 
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

entity xnormodule is
port(in1,in2:in std_logic;
out1:out std_logic);
end xnormodule;

architecture Behavioral of xnormodule is
component orfile is
port(in1,in2:in std_logic;
out1:out std_logic);
end component;
component notfile is
port(in1:in std_logic;
out1:out std_logic);
end component;
component andmodule is
port(in1,in2:in std_logic;
out1:out std_logic);
end component;
signal temp1,temp2,temp3,temp4:std_logic;
begin
first:notfile port map(in1=>in1,out1=>temp1);
second:notfile port map(in1=>in2,out1=>temp2);
third:andmodule port map(in1=>in1,in2=>in2,out1=>temp3);
fourth:andmodule port map(in1=>temp1,in2=>temp2,out1=>temp4);
fifth:orfile port map(in1=>temp3,in2=>temp4,out1=>out1);
end Behavioral;

