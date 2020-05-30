----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:43:02 05/28/2020 
-- Design Name: 
-- Module Name:    store_50 - Behavioral 
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

entity store_50 is
	port(	data_in: in std_logic_vector(19 downto 0);
			address: in std_logic_vector(5 downto 0);
			clk,w_en,r_en,reset: in std_logic;
			data_out: out std_logic_vector(19 downto 0)
			);
end store_50;

architecture Behavioral of store_50 is
	component reg_20_bit
		port(	data_in: in std_logic_vector(19 downto 0);
				clk,reset,w_en: in std_logic;
				data_out: out std_logic_vector(19 downto 0)
				);
	end component;
	component decoder_6_64
		port(	a: in std_logic_vector(5 downto 0);
				en: in std_logic;
				d_out: out std_logic_vector(63 downto 0)
				);
	end component;
	type mem_sel is array (0 to 49) of std_logic;
	wr_en: mem_sel;
begin
	mem0: reg_20_bit port map(data_in,clk,reset,w_en,d_out);
	mem0: reg_20_bit port map(data_in,clk,reset,w_en,d_out);
	mem0: reg_20_bit port map(data_in,clk,reset,w_en,d_out);
	mem0: reg_20_bit port map(data_in,clk,reset,w_en,d_out);
	mem0: reg_20_bit port map(data_in,clk,reset,w_en,d_out);
	mem0: reg_20_bit port map(data_in,clk,reset,w_en,d_out);
	mem0: reg_20_bit port map(data_in,clk,reset,w_en,d_out);
	mem0: reg_20_bit port map(data_in,clk,reset,w_en,d_out);
	mem0: reg_20_bit port map(data_in,clk,reset,w_en,d_out);
	mem0: reg_20_bit port map(data_in,clk,reset,w_en,d_out);
	mem0: reg_20_bit port map(data_in,clk,reset,w_en,d_out);
	mem0: reg_20_bit port map(data_in,clk,reset,w_en,d_out);
	mem0: reg_20_bit port map(data_in,clk,reset,w_en,d_out);
	mem0: reg_20_bit port map(data_in,clk,reset,w_en,d_out);
	mem0: reg_20_bit port map(data_in,clk,reset,w_en,d_out);
	mem0: reg_20_bit port map(data_in,clk,reset,w_en,d_out);
	mem0: reg_20_bit port map(data_in,clk,reset,w_en,d_out);
	mem0: reg_20_bit port map(data_in,clk,reset,w_en,d_out);
	mem0: reg_20_bit port map(data_in,clk,reset,w_en,d_out);
	mem0: reg_20_bit port map(data_in,clk,reset,w_en,d_out);
	mem0: reg_20_bit port map(data_in,clk,reset,w_en,d_out);
	mem0: reg_20_bit port map(data_in,clk,reset,w_en,d_out);
	mem0: reg_20_bit port map(data_in,clk,reset,w_en,d_out);
	mem0: reg_20_bit port map(data_in,clk,reset,w_en,d_out);
	mem0: reg_20_bit port map(data_in,clk,reset,w_en,d_out);
	mem0: reg_20_bit port map(data_in,clk,reset,w_en,d_out);
	mem0: reg_20_bit port map(data_in,clk,reset,w_en,d_out);
	mem0: reg_20_bit port map(data_in,clk,reset,w_en,d_out);
	mem0: reg_20_bit port map(data_in,clk,reset,w_en,d_out);
	mem0: reg_20_bit port map(data_in,clk,reset,w_en,d_out);
	mem0: reg_20_bit port map(data_in,clk,reset,w_en,d_out);
	mem0: reg_20_bit port map(data_in,clk,reset,w_en,d_out);
	mem0: reg_20_bit port map(data_in,clk,reset,w_en,d_out);
	mem0: reg_20_bit port map(data_in,clk,reset,w_en,d_out);
	mem0: reg_20_bit port map(data_in,clk,reset,w_en,d_out);
	mem0: reg_20_bit port map(data_in,clk,reset,w_en,d_out);
	mem0: reg_20_bit port map(data_in,clk,reset,w_en,d_out);
	mem0: reg_20_bit port map(data_in,clk,reset,w_en,d_out);
end Behavioral;

