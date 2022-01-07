--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:54:49 12/22/2021
-- Design Name:   
-- Module Name:   /home/ise/vhdl_lab/submit/rcs1/tb_keygen.vhd
-- Project Name:  idea_rcs1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: keygen
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
 
ENTITY tb_keygen IS
END tb_keygen;
 
ARCHITECTURE behavior OF tb_keygen IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT keygen
    PORT(
         KEYIN : IN  std_logic_vector(127 downto 0);
         SEL : IN  std_logic_vector(3 downto 0);
         PKEY1 : OUT  std_logic_vector(15 downto 0);
         PKEY2 : OUT  std_logic_vector(15 downto 0);
         PKEY3 : OUT  std_logic_vector(15 downto 0);
         PKEY4 : OUT  std_logic_vector(15 downto 0);
         PKEY5 : OUT  std_logic_vector(15 downto 0);
         PKEY6 : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal KEYIN : std_logic_vector(127 downto 0) := (others => '0');
   signal SEL : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal PKEY1 : std_logic_vector(15 downto 0);
   signal PKEY2 : std_logic_vector(15 downto 0);
   signal PKEY3 : std_logic_vector(15 downto 0);
   signal PKEY4 : std_logic_vector(15 downto 0);
   signal PKEY5 : std_logic_vector(15 downto 0);
   signal PKEY6 : std_logic_vector(15 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: keygen PORT MAP (
          KEYIN => KEYIN,
          SEL => SEL,
          PKEY1 => PKEY1,
          PKEY2 => PKEY2,
          PKEY3 => PKEY3,
          PKEY4 => PKEY4,
          PKEY5 => PKEY5,
          PKEY6 => PKEY6
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;

      -- insert stimulus here 
		KEYIN <= x"00010002000300040005000600070008";
		SEL <= x"0";
		
		wait for 100 ns;
		SEL <= x"1";
		
		wait for 100 ns;
		SEL <= x"2";
		
		wait for 100 ns;
		SEL <= x"3";
		
		wait for 100 ns;
		SEL <= x"4";
		
		wait for 100 ns;
		SEL <= x"5";
		
		wait for 100 ns;
		SEL <= x"6";
		
		wait for 100 ns;
		SEL <= x"7";
		
		wait for 100 ns;
		SEL <= x"8";
		
      wait;
   end process;

END;
