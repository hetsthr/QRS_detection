----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:50:53 05/28/2020 
-- Design Name: 
-- Module Name:    Shift_Register_12 - Behavioral 
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

entity Shift_Register_12 is
	port(data:in std_logic_vector(11 downto 0);CLK,S,R:in std_logic;Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8:out std_logic_vector(11 downto 0));
end Shift_Register_12;

architecture Behavioral of Shift_Register_12 is
component D_flip_flop_12
	port (D:in std_logic_vector(11 downto 0);CLK,S,R:in std_logic;Q,Q_bar:out std_logic_vector(11 downto 0));  
end component;
component buffer_12
	port (x:in std_logic_vector(11 downto 0); y:out std_logic_vector(11 downto 0));
end component;
type arr is array (8 downto 0) of std_logic_vector(11 downto 0);
signal  qt1,qt1_bar:arr;
begin

	DFF1: D_flip_flop_12 port map(data,CLK,S,R,qt1(0),qt1_bar(0));
	DFF2: D_flip_flop_12 port map(qt1(0),CLK,S,R,qt1(1),qt1_bar(1));
	DFF3: D_flip_flop_12 port map(qt1(1),CLK,S,R,qt1(2),qt1_bar(2));
	DFF4: D_flip_flop_12 port map(qt1(2),CLK,S,R,qt1(3),qt1_bar(3));
	DFF5: D_flip_flop_12 port map(qt1(3),CLK,S,R,qt1(4),qt1_bar(4));
	DFF6: D_flip_flop_12 port map(qt1(4),CLK,S,R,qt1(5),qt1_bar(5));
	DFF7: D_flip_flop_12 port map(qt1(5),CLK,S,R,qt1(6),qt1_bar(6));
	DFF8: D_flip_flop_12 port map(qt1(6),CLK,S,R,qt1(7),qt1_bar(7));
	DFF9: D_flip_flop_12 port map(qt1(7),CLK,S,R,qt1(8),qt1_bar(8));
	
	BUF1: buffer_12 port map (qt1(0),Q0);
	BUF2: buffer_12 port map (qt1(1),Q1);
	BUF3: buffer_12 port map (qt1(2),Q2);
	BUF4: buffer_12 port map (qt1(3),Q3);
	BUF5: buffer_12 port map (qt1(4),Q4);
	BUF6: buffer_12 port map (qt1(5),Q5);
	BUF7: buffer_12 port map (qt1(6),Q6);
	BUF8: buffer_12 port map (qt1(7),Q7);
	BUF9: buffer_12 port map (qt1(8),Q8);

end Behavioral;

