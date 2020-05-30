----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:54:04 05/12/2020 
-- Design Name: 
-- Module Name:    tflipflop - Behavioral 
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

entity tflipflop is
port(t,clk:in std_logic;
q:out std_logic);
end tflipflop;

architecture Behavioral of tflipflop is
component andmodule is
port(in1,in2,in3: in std_logic;
out1: out std_logic);
end component;
component norfile is
port(in1,in2: in std_logic;
out1: out std_logic);
end component;
signal temp1,temp2,temp3,temp4:std_logic;
begin
first:andmodule port map(in1=>t ,in2=>clk ,in3=>temp3 ,out1=>temp1);
second:andmodule port map (in1=>t, in2=>clk, in3=>temp4 ,out1=>temp2);
third:norfile port map(in1=>temp1,in2=>temp4 ,out1=>temp3);
fourth:norfile port map(in1=>temp2,in2=>temp3,out1=>temp4);
q<=temp3;

end Behavioral;

