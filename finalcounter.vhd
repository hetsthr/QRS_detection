----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:05:10 05/19/2020 
-- Design Name: 
-- Module Name:    finalcounter - Behavioral 
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

entity finalcounter is
port(clk,clear,preset:in std_logic;
q0,q1,q2:out std_logic);
end finalcounter;

architecture Behavioral of finalcounter is
component JKflipflop is
port(j,k,clk,clear_bar,preset_bar:in std_logic;
q:out std_logic);

end component;
component andmodule is
port(in1,in2: in std_logic;
out1: out std_logic);
end component;
signal temp1,temp2,temp3,temp4:std_logic;
begin
D1: JKflipflop port map('1','1',clk,clear,preset,temp1);
D2: JKflipflop port map(temp1,temp1,clk,clear,preset,temp2);
D4: andmodule port map(temp1,temp2,temp3);
D3: JKflipflop port map(temp3,temp3,clear,preset,temp4);
q0<=temp1;
q1<=temp2;
q2<=temp4;
end Behavioral;

