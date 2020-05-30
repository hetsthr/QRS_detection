----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:39:58 05/28/2020 
-- Design Name: 
-- Module Name:    mux_64x1_20 - Behavioral 
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

entity mux_64x1_20 is
	port(	i0,i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14,i15,i16,i17,i18,i19,i20,i21,i22,i23,i24,i25,i26,i27,i28,i29,
			i30,i31,i32,i33,i34,i35,i36,i37,i38,i39,i40,i41,i42,i43,i44,i45,i46,i47,i48,i49,i50,i51,i52,i53,i54,i55,i56,i57,
			i58,i59,i60,i61,i62,i63: in std_logic_vector(19 downto 0);
			s: in std_logic_vector(5 downto 0);
			o: out std_logic_vector(19 downto 0)
			);
end mux_64x1_20;

architecture Behavioral of mux_64x1_20 is
	component mux_8x1_20
		port(	i0,i1,i2,i3,i4,i5,i6,i7: in std_logic_vector(19 downto 0);
				s: in std_logic_vector(2 downto 0);
				o: out std_logic_vector(19 downto 0)
				);
	end component;
	type mux_out is array(0 to 7) of std_logic_vector(19 downto 0);
	signal temp: mux_out;
begin
	M1: mux_8x1_20 port map(i0,i1,i2,i3,i4,i5,i6,i7,s(2 downto 0),temp(0));
	M2: mux_8x1_20 port map(i8,i9,i10,i11,i12,i13,i14,i15,s(2 downto 0),temp(1));
	M3: mux_8x1_20 port map(i16,i17,i18,i19,i20,i21,i22,i23,s(2 downto 0),temp(2));
	M4: mux_8x1_20 port map(i24,i25,i26,i27,i28,i29,i30,i31,s(2 downto 0),temp(3));
	M5: mux_8x1_20 port map(i32,i33,i34,i35,i36,i37,i38,i39,s(2 downto 0),temp(4));
	M6: mux_8x1_20 port map(i40,i41,i42,i43,i44,i45,i46,i47,s(2 downto 0),temp(5));
	M7: mux_8x1_20 port map(i48,i49,i50,i51,i52,i53,i54,i55,s(2 downto 0),temp(6));
	M8: mux_8x1_20 port map(i56,i57,i58,i59,i60,i61,i62,i63,s(2 downto 0),temp(7));
	
	M9: mux_8x1_20 port map(temp(0),temp(1),temp(2),temp(3),temp(4),temp(5),temp(6),temp(7),s(5 downto 3),o);
end Behavioral;

