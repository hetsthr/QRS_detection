--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   02:18:57 05/30/2020
-- Design Name:   
-- Module Name:   D:/DA-IICT/Sem2/VLSI Subsystem Design/ECG Assignment/VHDL/band_pass/adaptive_thresholding_tb.vhd
-- Project Name:  band_pass
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: adaptive_thresholding
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
 
ENTITY adaptive_thresholding_tb IS
END adaptive_thresholding_tb;
 
ARCHITECTURE behavior OF adaptive_thresholding_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT adaptive_thresholding
    PORT(
         data_in : IN  std_logic_vector(7 downto 0);
         clk : IN  std_logic;
         clr : IN  std_logic;
			peak_detected: OUT std_logic;
         data_out : OUT  std_logic_vector(20 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal data_in : std_logic_vector(7 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal clr : std_logic := '1';
	signal input: std_logic_vector(7 downto 0);
	constant ZERO : integer := 0;
	
 	--Outputs
	signal peak_detected: std_logic;
   signal data_out : std_logic_vector(20 downto 0);
	signal output_ready: std_logic;
	file my_input : TEXT open READ_MODE is "output100_new_mvg.txt";
	file my_output: TEXT open WRITE_MODE is "output100_peaks_location_I_testing.txt";
--	file my_output: TEXT open WRITE_MODE is "output100_peaks_I_testing.txt";
   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: adaptive_thresholding PORT MAP (
          data_in => data_in,
          clk => clk,
          clr => clr,
			 peak_detected => peak_detected,
          data_out => data_out
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
				data_in <= (others=> '0');
				input <= (others => '0');
				output_ready <= '0';
			elsif rising_edge(clk) then
				readline(my_input, my_input_line);
				read(my_input_line,input1);
				data_in <= std_logic_vector(to_signed(input1,8));
				output_ready <= '1';
			end if;
		end process;
		
		process(clk)
		variable my_output_line: LINE;
		variable input1: integer;
		begin
			if falling_edge(clk) then
				if output_ready = '1' then
					if data_out(19) = '0' and data_out(20) = '1' then
--						write(my_output_line, to_integer(signed(data_out(19 downto 12))));
						write(my_output_line, to_integer(unsigned(data_out(11 downto 0))));
						writeline(my_output,my_output_line);
					end if;
				end if;
			end if;
		end process;
END;
