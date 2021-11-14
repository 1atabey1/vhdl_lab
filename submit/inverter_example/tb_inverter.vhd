--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:16:29 11/13/2021
-- Design Name:   
-- Module Name:   /home/ise/ise_projects/submit/inverter_example/tb_inverter.vhd
-- Project Name:  inverter_example
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: inverter
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_inverter IS
END tb_inverter;
 
ARCHITECTURE behavior OF tb_inverter IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT inverter
    PORT(
         I : IN  std_logic;
         O : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal I : std_logic := '0';

 	--Outputs
   signal O : std_logic;
 
   constant I_period : time := 10 ns;
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: inverter PORT MAP (
          I => I,
          O => O
        );

   -- Clock process definitions
   I_process :process
   begin
		I <= '0';
		wait for I_period/2;
		I <= '1';
		wait for I_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for I_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
