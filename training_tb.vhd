--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:21:04 05/24/2020
-- Design Name:   
-- Module Name:   D:/DA-IICT/Sem2/VLSI Subsystem Design/ECG Assignment/VHDL/band_pass/training_tb.vhd
-- Project Name:  band_pass
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: training_phase
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
 
ENTITY training_tb IS
END training_tb;
 
ARCHITECTURE behavior OF training_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT training_phase
    PORT(
         data_in : IN  std_logic_vector(7 downto 0);
         clk : IN  std_logic;
         clr : IN  std_logic;
         training_complete : OUT  std_logic;
         thr_sig : OUT  std_logic_vector(7 downto 0);
			thr_noise : OUT std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal data_in : std_logic_vector(7 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal clr : std_logic := '0';
	signal input: std_logic_vector(7 downto 0);
 	--Outputs
   signal training_complete : std_logic;
   signal thr_sig,thr_noise : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
	file my_input : TEXT open READ_MODE is "output100_new.txt";
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: training_phase PORT MAP (
          data_in => data_in,
          clk => clk,
          clr => clr,
          training_complete => training_complete,
          thr_sig => thr_sig,
			 thr_noise => thr_noise
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
			elsif rising_edge(clk) then
				readline(my_input, my_input_line);
				read(my_input_line,input1);
				data_in <= std_logic_vector(to_signed(input1,8));
			end if;
		end process;

END;
