----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:04:01 05/24/2020 
-- Design Name: 
-- Module Name:    Adder_1 - Behavioral 
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

entity Adder_1 is
port(A,B,Cin:in std_logic; Sum,Carry:out std_logic); 
end Adder_1;

architecture Behavioral of Adder_1 is
component PFA
	port(A,B,C:in std_logic; S,G,P:out std_logic);
end component;
component and_1
	port(x,y:in std_logic; z:out std_logic);
end component;
component or_1
	port (x,y:in std_logic; z:out std_logic);
end component;
signal G,P,s1:std_logic;
begin

	PFA_1: PFA port map(A,B,Cin,Sum,G,P);
	A1: and_1 port map(P,Cin,s1);
	O1: or_1 port map(s1,G,Carry);

end Behavioral;

