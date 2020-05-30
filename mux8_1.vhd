----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:07:21 05/30/2020 
-- Design Name: 
-- Module Name:    mux8_1 - Behavioral 
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

entity mux8_1 is
port(a,b,c,d,e,f,g,h:in std_logic_vector(11 downto 0);
out1:out std_logic_vector(11 downto 0);
s0,s1,s2:in std_logic);
end mux8_1;

architecture Behavioral of mux8_1 is
component mux1_2 is
    Port ( 
			  S : in  STD_LOGIC;
			  X : in  STD_LOGIC_VECTOR (11 downto 0);
           Y : in  STD_LOGIC_VECTOR (11 downto 0);
           Z : out  STD_LOGIC_VECTOR (11 downto 0)
           );
end component;
signal first,second,third,fourth,fifth,sixth,seventh:std_logic_vector(11 downto 0);
begin
a1:mux1_2 port map(s0,a,b,first);
a2:mux1_2 port map(s0,c,d,second);
a3:mux1_2 port map(s0,e,f,third);
a4:mux1_2 port map(s0,g,h,fourth);
a5:mux1_2 port map(s1,first,second,fifth);
a6:mux1_2 port map(s1,third,fourth,sixth);
a7:mux1_2 port map(s2,fifth,sixth,seventh);
out1<=seventh;
end Behavioral;

