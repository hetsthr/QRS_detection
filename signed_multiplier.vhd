----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:52:39 05/14/2020 
-- Design Name: 
-- Module Name:    signed_multiplier - Behavioral 
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

entity signed_multiplier is
	port( a,b: in std_logic_vector(7 downto 0);
			p: out std_logic_vector (15 downto 0)
			);
end signed_multiplier;

architecture Behavioral of signed_multiplier is
	component mux_8
		port(	i0,i1: in std_logic_vector (7 downto 0);
				s: in std_logic;
				o: out std_logic_vector (7 downto 0)
				);
	end component;
	component mux_16 
		port(	i0,i1: in std_logic_vector (15 downto 0);
				s: in std_logic;
				o: out std_logic_vector (15 downto 0)
				);
	end component;
	component multiplier_8
		port(	a,b: in std_logic_vector (7 downto 0);
				p: out std_logic_vector (15 downto 0)
				);
	end component;
	component twos_comp
		port(	a: in std_logic_vector (7 downto 0);
				b: out std_logic_vector (7 downto 0)
				);
	end component;
	component twos_comp_16
		port(	a: in std_logic_vector (15 downto 0);
				b: out std_logic_vector (15 downto 0)
				);
	end component;
	signal a_neg,b_neg,in_a,in_b: std_logic_vector (7 downto 0);
	signal sign_bit: std_logic;
	signal temp_out,neg_out: std_logic_vector (15 downto 0);
begin
	sign_bit <= a(7) xor b(7);
	comp1: twos_comp port map (a,a_neg);
	comp2: twos_comp port map (b,b_neg);
	mux1: mux_8 port map (a,a_neg,a(7),in_a);
	mux2: mux_8 port map (b,b_neg,b(7),in_b);
	mul1: multiplier_8 port map (in_a,in_b,temp_out);
	comp3: twos_comp_16 port map (temp_out,neg_out);
	mux3: mux_16 port map (temp_out,neg_out,sign_bit,p);
end Behavioral;

