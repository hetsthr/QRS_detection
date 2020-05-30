----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:11:01 05/25/2020 
-- Design Name: 
-- Module Name:    store_max - Behavioral 
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

entity store_max is
	port(	a: in std_logic_vector(7 downto 0);
			clk,reset: in std_logic;
			max_val: out std_logic_vector(7 downto 0)
			);
end store_max;

architecture Behavioral of store_max is
	component reg_8_bit
		port(	data_in: in std_logic_vector(7 downto 0);
				clk,clr,w_en: in std_logic;
				data_out: out std_logic_vector(7 downto 0)
				);
	end component;
	component signed_comparator
		port(	a,b: in  STD_LOGIC_VECTOR(7 downto 0);
				z: out  STD_LOGIC
				);
	end component;
	signal gt_en: std_logic;
	signal b: std_logic_vector(7 downto 0);
begin
	comparator1: signed_comparator port map(a,b,gt_en);
	store1: reg_8_bit port map(a,clk,reset,gt_en,b);
	max_val <= b;
end Behavioral;

