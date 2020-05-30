----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:21:01 05/12/2020 
-- Design Name: 
-- Module Name:    multiplier_4 - Behavioral 
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

entity multiplier_4 is
	port(	a,b: in std_logic_vector (3 downto 0);
			res: out std_logic_vector (7 downto 0)			
			);
end multiplier_4;

architecture Behavioral of multiplier_4 is
	signal res1,res2,res3,res4,res5,in1: std_logic_vector (3 downto 0);
	signal in2,in3,in4,res6: std_logic_vector (5 downto 0);
	signal c1,c2,c3: std_logic;
	component multiplier_2
		port(	a,b: in std_logic_vector(1 downto 0);
				m: out std_logic_vector(3 downto 0)
				);
	end component;
	
	component RCA4 
		port(	a,b: in std_logic_vector (3 downto 0);
				sum: out std_logic_vector (3 downto 0);
				c_out: out std_logic
				);
	end component;
	
	component RCA6
		port(	a,b: in std_logic_vector (5 downto 0);
				sum: out std_logic_vector (5 downto 0);
				c_out: out std_logic
				);
	end component;
begin
	vedic2_1: multiplier_2 port map(a(1 downto 0),b(1 downto 0),res1);
	vedic2_2: multiplier_2 port map(a(3 downto 2),b(1 downto 0),res2);
	vedic2_3: multiplier_2 port map(a(1 downto 0),b(3 downto 2),res3);
	vedic2_4: multiplier_2 port map(a(3 downto 2),b(3 downto 2),res4);
	in1 <= ("00"&res1(3 downto 2));
	in2 <= ("00"&res3);
	in3 <= (res4&"00");
	ADD4_1: RCA4 port map(in1,res2,res5,c1);
	ADD6_1: RCA6 port map(in2,in3,res6,c2);
	in4 <= ("00"&res5);
	ADD6_2: RCA6 port map(in4,res6,res(7 downto 2),c3);
	res(1 downto 0) <= res1(1 downto 0);
end Behavioral;
