--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:55:13 05/29/2020
-- Design Name:   
-- Module Name:   D:/DA-IICT/Sem2/VLSI Subsystem Design/ECG Assignment/VHDL/band_pass/fudicial_tb.vhd
-- Project Name:  band_pass
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: fiducial_marks
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
 
ENTITY fudicial_tb IS
END fudicial_tb;
 
ARCHITECTURE behavior OF fudicial_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT fiducial_marks
    PORT(
         ecg_in : IN  std_logic_vector(7 downto 0);
         clk : IN  std_logic;
         reset : IN  std_logic;
--			block_done: OUT std_logic;
         data_out : OUT  std_logic_vector(19 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ecg_in : std_logic_vector(7 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal reset : std_logic := '1';
	signal input: std_logic_vector(7 downto 0);
 	--Outputs
--	signal block_done: std_logic := '0';
   signal data_out : std_logic_vector(19 downto 0);
--	signal output_ready : std_logic:='1';
--	signal te: std_logic:='1';
--	signal gated_clk: std_logic;
   -- Clock period definitions
   constant clk_period : time := 10 ns;
	file my_input : TEXT open READ_MODE is "output100_new.txt";
--	file my_output: TEXT open WRITE_MODE is "output100_fudicial.txt";
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: fiducial_marks PORT MAP (
          ecg_in => ecg_in,
          clk => clk,
          reset => reset,
--			 block_done => block_done,
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
   -- hold reset state for 100 ns.
		reset <= '1', '1' after 20 ns, '0' after 30 ns;
      -- insert stimulus here 
		process(clk)
		variable my_input_line : LINE;
		variable input1: integer;
		begin
			if reset = '1' then
				ecg_in <= (others=> '0');
				input <= (others => '0');
--				te <= '0';
			elsif rising_edge(clk) then
					readline(my_input, my_input_line);
					read(my_input_line,input1);
					ecg_in <= std_logic_vector(to_signed(input1,8));
--					te <= '1';
			end if;
		end process;
		
END;
