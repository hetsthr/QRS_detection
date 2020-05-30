----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:49:17 05/27/2020 
-- Design Name: 
-- Module Name:    Shift_Register_8_2 - Behavioral 
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

entity Shift_Register_8_2 is
port(data:in std_logic_vector(7 downto 0);CLK,S,R:in std_logic;Q0,Q1,Q2,Q3:out std_logic_vector(7 downto 0));
end Shift_Register_8_2;

architecture Behavioral of Shift_Register_8_2 is
component D_flip_flop_8
	port (D:in std_logic_vector(7 downto 0);CLK,S,R:in std_logic;Q,Q_bar:out std_logic_vector(7 downto 0));  
end component;
component buffer_8
	port (x:in std_logic_vector(7 downto 0); y:out std_logic_vector(7 downto 0));
end component;
type arr is array (3 downto 0) of std_logic_vector(7 downto 0);
signal  qt1,qt1_bar:arr;
begin

	DFF1: D_flip_flop_8 port map(data,CLK,S,R,qt1(0),qt1_bar(0));
	DFF2: D_flip_flop_8 port map(qt1(0),CLK,S,R,qt1(1),qt1_bar(1));
	DFF3: D_flip_flop_8 port map(qt1(1),CLK,S,R,qt1(2),qt1_bar(2));
	DFF4: D_flip_flop_8 port map(qt1(2),CLK,S,R,qt1(3),qt1_bar(3));
	
	BUF1: buffer_8 port map (qt1(0),Q0);
	BUF2: buffer_8 port map (qt1(1),Q1);
	BUF3: buffer_8 port map (qt1(2),Q2);
	BUF4: buffer_8 port map (qt1(3),Q3);

end Behavioral;

