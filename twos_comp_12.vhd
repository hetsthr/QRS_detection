----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:20:22 05/29/2020 
-- Design Name: 
-- Module Name:    twos_comp_12 - Behavioral 
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

entity twos_comp_12 is
	port(x: in std_logic_vector(11 downto 0); y:out std_logic_vector(11 downto 0));
end twos_comp_12;

architecture Behavioral of twos_comp_12 is
component not_12
	port(x: in std_logic_vector(11 downto 0); y:out std_logic_vector(11 downto 0));
end component;
component Adder_1
	port(A,B,Cin:in std_logic; Sum,Carry:out std_logic); 
end component;
signal c_x,cr: std_logic_vector(11 downto 0);
begin

	N1: not_12 port map(x,c_x);
	ADD1: Adder_1 port map(c_x(0),'1','0',y(0),cr(0));
	ADD2: Adder_1 port map(c_x(1),'0',cr(0),y(1),cr(1));
	ADD3: Adder_1 port map(c_x(2),'0',cr(1),y(2),cr(2));
	ADD4: Adder_1 port map(c_x(3),'0',cr(2),y(3),cr(3));
	ADD5: Adder_1 port map(c_x(4),'0',cr(3),y(4),cr(4));
	ADD6: Adder_1 port map(c_x(5),'0',cr(4),y(5),cr(5));
	ADD7: Adder_1 port map(c_x(6),'0',cr(5),y(6),cr(6));
	ADD8: Adder_1 port map(c_x(7),'0',cr(6),y(7),cr(7));
	ADD9: Adder_1 port map(c_x(8),'0',cr(7),y(8),cr(8));
	ADD10: Adder_1 port map(c_x(9),'0',cr(8),y(9),cr(9));
	ADD11: Adder_1 port map(c_x(10),'0',cr(9),y(10),cr(10));
	ADD12: Adder_1 port map(c_x(11),'0',cr(10),y(11),cr(11));

end Behavioral;

