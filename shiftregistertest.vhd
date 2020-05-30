----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:03:01 05/27/2020 
-- Design Name: 
-- Module Name:    shiftregistertest - Behavioral 
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

entity shiftregistertest is
port(data:in std_logic_vector(15 downto 0);CLK:in std_logic;Q0,Q1,Q2,Q3,Q4:out std_logic_vector(15 downto 0));
end shiftregistertest;

architecture Behavioral of shiftregistertest is
component D_flip_flop_16
	port (D:in std_logic_vector(15 downto 0);CLK,S,R:in std_logic;Q,Q_bar:out std_logic_vector(15 downto 0)); 
end component;
component buffer_16
	port (x:in std_logic_vector(15 downto 0); y:out std_logic_vector(15 downto 0));
end component;
signal S,R:std_logic;
type arr is array (4 downto 0) of std_logic_vector(15 downto 0);
signal  qt1,qt1_bar:std_logic_vector(15 downto 0);
begin

	DFF1: D_flip_flop_16 port map(data,CLK,S,R,qt1,qt1_bar);
	BUF1: buffer_16 port map (qt1,Q0);
	
	DFF2: D_flip_flop_16 port map(qt1,CLK,S,R,qt1,qt1_bar);
	BUF2: buffer_16 port map (qt1,Q1);
	
	DFF3: D_flip_flop_16 port map(qt1,CLK,S,R,qt1,qt1_bar);
	BUF3: buffer_16 port map (qt1,Q2);
	
	DFF4: D_flip_flop_16 port map(qt1,CLK,S,R,qt1,qt1_bar);
	BUF4: buffer_16 port map (qt1,Q3);
	
	DFF5: D_flip_flop_16 port map(qt1,CLK,S,R,qt1,qt1_bar);
	BUF5: buffer_16 port map (qt1,Q4);
	
	
	
	
	

end Behavioral;

