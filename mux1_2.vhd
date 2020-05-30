----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:00:45 05/30/2020 
-- Design Name: 
-- Module Name:    mux1_2 - Behavioral 
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

entity mux1_2 is
    Port ( 
			  S : in  STD_LOGIC;
			  X : in  STD_LOGIC_VECTOR (11 downto 0);
           Y : in  STD_LOGIC_VECTOR (11 downto 0);
           Z : out  STD_LOGIC_VECTOR (11 downto 0)
           );
end mux1_2;

architecture Structural of mux1_2 is
component not_12 is
port(x:in std_logic_vector(11 downto 0); y:out std_logic_vector(11 downto 0));
end component;

component and_12 is
port(a,b:in std_logic_vector(11 downto 0);
out1:out std_logic_vector(11 downto 0));
end component;

component or_12 is
port(a,b:in std_logic_vector(11 downto 0);
out1:out std_logic_vector(11 downto 0));
end component;

signal sel,p,out2,sel_bar : STD_LOGIC_VECTOR(11 downto 0);
begin
sel <= S & S & S & S & S & S & S & S & S & S & S & S;
x1:not_12 port map(sel,sel_bar);
x2:and_12 port map(sel_bar,X,p);
x3:and_12 port map(sel,Y,out2);
x4:or_12 port map(out2,p,Z);
end Structural;

