--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:33:36 05/27/2020
-- Design Name:   
-- Module Name:   D:/DA-IICT/Sem2/VLSI Subsystem Design/ECG Assignment/VHDL/band_pass/squaring_tb.vhd
-- Project Name:  band_pass
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: squaring
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE IEEE.numeric_std.all;  
Use STD.TEXTIO.all; 
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY squaring_tb IS
END squaring_tb;
 
ARCHITECTURE behavior OF squaring_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT squaring
    PORT(
         a : IN  std_logic_vector(7 downto 0);
         s : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(7 downto 0) := (others => '0');
	signal clk : std_logic := '0';
   signal clr : std_logic := '0';
	signal input: std_logic_vector(7 downto 0);
	signal output_ready : std_logic:='1';
 	--Outputs
   signal s : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clk_period : time := 10 ns;
	file my_input : TEXT open READ_MODE is "output100_new_fivept.txt";
	file my_output: TEXT open WRITE_MODE is "output100_sqr.txt";
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: squaring PORT MAP (
          a => a,
          s => s
        );

   -- Clock process definitions
	clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   clr <= '1', '1' after 20 ns, '0' after 30 ns;
	-- insert stimulus here 
	process(clk)
	variable my_input_line : LINE;
	variable input1: integer;
	begin
		if clr = '1' then
			a <= (others=> '0');
			input <= (others => '0');
		elsif rising_edge(clk) then
			readline(my_input, my_input_line);
			read(my_input_line,input1);
			a <= std_logic_vector(to_signed(input1,8));
			output_ready <= '1';
		end if;
	end process;
	
	process(clk)
		variable my_output_line : LINE;
		variable input1: integer;
		begin
			if falling_edge(clk) then
				if output_ready = '1' then
					write(my_output_line, to_integer(signed(s)));
					writeline(my_output,my_output_line);
				end if;
			end if;
		end process;

END;
