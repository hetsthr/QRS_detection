----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:27:03 05/07/2020 
-- Design Name: 
-- Module Name:    filter - Behavioral 
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
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity filter is
port(	ecg_in: in std_logic_vector(7 downto 0); -- Input Data
		clk,reset: in std_logic;
		bpf_out: out std_logic_vector (7 downto 0) -- Output Data
		);
end filter;

architecture Behavioral of filter is
	type ecg_data is array (0 to 31) of std_logic_vector (7 downto 0);
	type mul_res is array (0 to 15) of std_logic_vector (15 downto 0);
	type coeff_storage is array (0 to 15) of std_logic_vector (7 downto 0);
	signal x : ecg_data;
	signal mul_result : mul_res;
	signal temp_out: std_logic_vector (15 downto 0);
	constant coeff: coeff_storage:=
		(
			"11111100",
			"11111110",
			"11111110",
			"11111101",
			"11111101",
			"11111110",
			"11111110",
			"11111111",
			"00000000",
			"00000001",
			"00000010",
			"00000011",
			"00000011",
			"00000100",
			"00000101",
			"00000101"
		);
	component filter_cell
	port(	in1,in2: in std_logic_vector(7 downto 0);
			coeff: in std_logic_vector(7 downto 0);
			clk,reset: in std_logic;
			q1,q2: out std_logic_vector(7 downto 0);
			result: out std_logic_vector(15 downto 0)
			);
	end component;
begin
	F0: filter_cell port map(ecg_in,x(30),coeff(0),clk,reset,x(0),x(31),mul_result(0));
	F1: filter_cell port map(x(0),x(29),coeff(1),clk,reset,x(1),x(30),mul_result(1));
	F2: filter_cell port map(x(1),x(28),coeff(2),clk,reset,x(2),x(29),mul_result(2));
	F3: filter_cell port map(x(2),x(27),coeff(3),clk,reset,x(3),x(28),mul_result(3));
	F4: filter_cell port map(x(3),x(26),coeff(4),clk,reset,x(4),x(27),mul_result(4));
	F5: filter_cell port map(x(4),x(25),coeff(5),clk,reset,x(5),x(26),mul_result(5));
	F6: filter_cell port map(x(5),x(24),coeff(6),clk,reset,x(6),x(25),mul_result(6));
	F7: filter_cell port map(x(6),x(23),coeff(7),clk,reset,x(7),x(24),mul_result(7));
	F8: filter_cell port map(x(7),x(22),coeff(8),clk,reset,x(8),x(23),mul_result(8));
	F9: filter_cell port map(x(8),x(21),coeff(9),clk,reset,x(9),x(22),mul_result(9));
	F10: filter_cell port map(x(9),x(20),coeff(10),clk,reset,x(10),x(21),mul_result(10));
	F11: filter_cell port map(x(10),x(19),coeff(11),clk,reset,x(11),x(20),mul_result(11));
	F12: filter_cell port map(x(11),x(18),coeff(12),clk,reset,x(12),x(19),mul_result(12));
	F13: filter_cell port map(x(12),x(17),coeff(13),clk,reset,x(13),x(18),mul_result(13));
	F14: filter_cell port map(x(13),x(16),coeff(14),clk,reset,x(14),x(17),mul_result(14));
	F15: filter_cell port map(x(14),x(15),coeff(15),clk,reset,x(15),x(16),mul_result(15));
	temp_out <= mul_result(0)+mul_result(1)+mul_result(2)+mul_result(3)+mul_result(4)+mul_result(5)+mul_result(6)+mul_result(7)+mul_result(8)+mul_result(9)+mul_result(10)+mul_result(11)+mul_result(12)+mul_result(13)+mul_result(14)+mul_result(15);
	bpf_out <= temp_out(13 downto 6);
end Behavioral;

