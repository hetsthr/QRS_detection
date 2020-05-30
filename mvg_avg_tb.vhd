--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:27:04 05/27/2020
-- Design Name:   
-- Module Name:   D:/DAIICT/Sem 2/BM/ECG/VHDL/Moving_Avg/mvg_avg_tb.vhd
-- Project Name:  Moving_Avg
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Moving_Avg
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
 
ENTITY mvg_avg_tb IS
END mvg_avg_tb;
 
ARCHITECTURE behavior OF mvg_avg_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Moving_Avg
    PORT(
         data_in : IN  std_logic_vector(7 downto 0);
         CLK : IN  std_logic;
         Set : IN  std_logic;
         Reset : IN  std_logic;
         mvg_avg : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal data_in : std_logic_vector(7 downto 0) := (others => '0');
   signal CLK : std_logic := '0';
   signal Set : std_logic := '1';
   signal Reset : std_logic := '1';
	signal input: std_logic_vector(7 downto 0);
 
 	--Outputs
   signal mvg_avg : std_logic_vector(7 downto 0);
	signal output_ready : std_logic:='1';

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
	file my_input : TEXT open READ_MODE is "output100_sqr.txt";
	file my_output: TEXT open WRITE_MODE is "output100_new_mvg.txt";
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Moving_Avg PORT MAP (
          data_in => data_in,
          CLK => CLK,
          Set => Set,
          Reset => Reset,
          mvg_avg => mvg_avg
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
 -- hold reset state for 100 ns.
		reset <= '0', '0' after 5 ns, '1' after 10 ns;

      -- insert stimulus here 
		process(clk)
		variable my_input_line : LINE;
		variable input1: integer;
		begin
			if reset = '0' then
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
		variable my_output_line : LINE;
		variable input1: integer;
		begin
			if falling_edge(clk) then
				if output_ready = '1' then
					write(my_output_line, to_integer(signed(mvg_avg)));
					writeline(my_output,my_output_line);
				end if;
			end if;
		end process;

END;
