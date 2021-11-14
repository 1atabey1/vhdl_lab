--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:53:34 11/13/2021
-- Design Name:   
-- Module Name:   /home/ise/ise_projects/submit/direct/tb_xorop.vhd
-- Project Name:  idea
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: xorop
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
USE ieee.numeric_std.ALL;

ENTITY tb_xorop IS
END tb_xorop;

ARCHITECTURE behavior OF tb_xorop IS

   -- Component Declaration for the Unit Under Test (UUT)

   COMPONENT xorop
      PORT (
         X : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
         Z : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
         Y : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
      );
   END COMPONENT;
   --Inputs
   SIGNAL X : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
   SIGNAL Z : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');

   --Outputs
   SIGNAL Y : STD_LOGIC_VECTOR(15 DOWNTO 0);
BEGIN

   -- Instantiate the Unit Under Test (UUT)
   uut : xorop PORT MAP(
      X => X,
      Z => Z,
      Y => Y
   );

   -- Stimulus process
   stim_proc : PROCESS
   BEGIN
      -- insert stimulus here 
      X <= (15 DOWNTO 0 => '0');
      Z <= (15 DOWNTO 0 => '0');
      X(6) <=  '1';
      Z(6) <=  '1'; 
      WAIT FOR 100 ns;
      Z(5) <= '1';
		WAIT FOR 100 ns;
   END PROCESS;

END;