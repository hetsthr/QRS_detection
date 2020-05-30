----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:53:14 05/15/2020 
-- Design Name: 
-- Module Name:    comparator16bit - Behavioral 
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
entity comparator16bit is
Port (A : in  STD_LOGIC_VECTOR(15 downto 0);
B : in  STD_LOGIC_VECTOR(15 downto 0);
G : out  STD_LOGIC);
end comparator16bit;

architecture Behavioral of comparator16bit is
signal X : STD_LOGIC_VECTOR(15 downto 0);
begin
X(15) <=A(15) xnor B(15);
X(14) <=A(14) xnor B(14);
X(13) <=A(13) xnor B(13);
X(12) <=A(12) xnor B(12);
X(11) <=A(11) xnor B(11);
X(10) <=A(10) xnor B(10);
X(9) <= A(9) xnor B(9);
X(8) <= A(8) xnor B(8);
X(7) <= A(7) xnor B(7);
X(6) <= A(6) xnor B(6);
X(5) <= A(5) xnor B(5);
X(4) <= A(4) xnor B(4);
X(3) <= A(3) xnor B(3);
X(2) <= A(2) xnor B(2);
X(1) <= A(1) xnor B(1);
X(0) <= A(0) xnor B(0);

G <=  ((not B(15)) and A(15))
or (X(15) and (not B(15)) and A(15))
or (X(15) and X(14) and (not B(14)) and A(14))
or (X(15) and X(14) and X(13) and (not B(13)) and A(13))
or (X(15) and X(14) and X(13) and X(12) and (not B(12)) and A(12))
or (X(15) and X(14) and X(13) and X(12) and X(11) and (not B(11)) and A(11))
or (X(15) and X(14) and X(13) and X(12) and X(11) and X(10) and (not B(10)) and A(10))
or (X(15) and X(14) and X(13) and X(12) and X(11) and X(10) and X(9) and (not B(9)) and A(9))
or (X(15) and X(14) and X(13) and X(12) and X(11) and X(10) and X(9) and X(8) and (not B(8)) and A(8))
or (X(15) and X(14) and X(13) and X(12) and X(11) and X(10) and X(9) and X(8) and X(7) and (not B(7)) and A(7))
or (X(15) and X(14) and X(13) and X(12) and X(11) and X(10) and X(9) and X(8) and X(7) and X(6) and (not B(6)) and A(6))
or (X(15) and X(14) and X(13) and X(12) and X(11) and X(10) and X(9) and X(8) and X(7) and X(6) and X(5)and(not B(5)) and A(5))
or (X(15) and X(14) and X(13) and X(12) and X(11) and X(10) and X(9) and X(8) and X(7) and X(6) and X(5) and X(4) and (not B(4)) and A(4))
or (X(15) and X(14) and X(13) and X(12) and X(11) and X(10) and X(9) and X(8) and X(7) and X(6) and X(5) and X(4) and X(3) and (not B(3)) and A(3))
or (X(15) and X(14) and X(13) and X(12) and X(11) and X(10) and X(9) and X(8) and X(7) and X(6) and X(5) and X(4) and X(3) and X(2) and (not B(2)) and A(2))
or (X(15) and X(14) and X(13) and X(12) and X(11) and X(10) and X(9) and X(8) and X(7) and X(6) and X(5) and X(4) and X(3) and X(2) and X(1) and (not B(1)) and A(1))
or (X(15) and X(14) and X(13) and X(12) and X(11) and X(10) and X(9) and X(8) and X(7) and X(6) and X(5) and X(4) and X(3) and X(2) and X(1) and X(0) and (not B(0)) and A(0));
end Behavioral;

