----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:04:29 05/28/2020 
-- Design Name: 
-- Module Name:    decoder_6_64 - Behavioral 
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

entity decoder_6_64 is
	port(	a: in std_logic_vector(5 downto 0);
			en: in std_logic;
			d_out: out std_logic_vector(63 downto 0)
			);
end decoder_6_64;

architecture Behavioral of decoder_6_64 is
	component decoder_2_4
		port( a: in std_logic_vector(1 downto 0);
				en: in std_logic;
				d_out: out std_logic_vector(3 downto 0)
				);
	end component;
	type dcd_out is array (0 to 20) of std_logic_vector(3 downto 0);
	signal d: dcd_out;
begin
	dcd0: decoder_2_4 port map(a(5 downto 4),en,d(0));
	
	dcd1_1: decoder_2_4 port map(a(3 downto 2),d(0)(0),d(1));
	dcd1_2: decoder_2_4 port map(a(3 downto 2),d(0)(1),d(2));
	dcd1_3: decoder_2_4 port map(a(3 downto 2),d(0)(2),d(3));
	dcd1_4: decoder_2_4 port map(a(3 downto 2),d(0)(3),d(4));
	
	dcd2_1: decoder_2_4 port map(a(1 downto 0),d(1)(0),d(5));
	dcd2_2: decoder_2_4 port map(a(1 downto 0),d(1)(1),d(6));
	dcd2_3: decoder_2_4 port map(a(1 downto 0),d(1)(2),d(7));
	dcd2_4: decoder_2_4 port map(a(1 downto 0),d(1)(3),d(8));
	
	dcd2_5: decoder_2_4 port map(a(1 downto 0),d(2)(0),d(9));
	dcd2_6: decoder_2_4 port map(a(1 downto 0),d(2)(1),d(10));
	dcd2_7: decoder_2_4 port map(a(1 downto 0),d(2)(2),d(11));
	dcd2_8: decoder_2_4 port map(a(1 downto 0),d(2)(3),d(12));
	
	dcd2_9: decoder_2_4 port map(a(1 downto 0),d(3)(0),d(13));
	dcd2_10: decoder_2_4 port map(a(1 downto 0),d(3)(1),d(14));
	dcd2_11: decoder_2_4 port map(a(1 downto 0),d(3)(2),d(15));
	dcd2_12: decoder_2_4 port map(a(1 downto 0),d(3)(3),d(16));
	
	dcd2_13: decoder_2_4 port map(a(1 downto 0),d(4)(0),d(17));
	dcd2_14: decoder_2_4 port map(a(1 downto 0),d(4)(1),d(18));
	dcd2_15: decoder_2_4 port map(a(1 downto 0),d(4)(2),d(19));
	dcd2_16: decoder_2_4 port map(a(1 downto 0),d(4)(3),d(20));
	
	d_out(63 downto 60) <= d(20);
	d_out(59 downto 56) <= d(19);
	d_out(55 downto 52) <= d(18);
	d_out(51 downto 48) <= d(17);
	d_out(47 downto 44) <= d(16);
	d_out(43 downto 40) <= d(15);
	d_out(39 downto 36) <= d(14);
	d_out(35 downto 32) <= d(13);
	d_out(31 downto 28) <= d(12);
	d_out(27 downto 24) <= d(11);
	d_out(23 downto 20) <= d(10);
	d_out(19 downto 16) <= d(9);
	d_out(15 downto 12) <= d(8);
	d_out(11 downto 8) <= d(7);
	d_out(7 downto 4) <= d(6);
	d_out(3 downto 0) <= d(5);

end Behavioral;

