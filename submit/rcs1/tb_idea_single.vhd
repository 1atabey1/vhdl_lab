--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:01:24 01/08/2022
-- Design Name:   
-- Module Name:   /home/ise/ise_projects/vhdl_lab/submit/rcs1/tb_idea_single.vhd
-- Project Name:  idea_rcs1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: idea_single
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
 
ENTITY tb_idea_single IS
END tb_idea_single;
 
ARCHITECTURE behavior OF tb_idea_single IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT idea_single
    PORT(
         CLOCK : IN  std_logic;
         START : IN  std_logic;
         KEY : IN  std_logic_vector(127 downto 0);
         X_1 : IN  std_logic_vector(15 downto 0);
         X_2 : IN  std_logic_vector(15 downto 0);
         X_3 : IN  std_logic_vector(15 downto 0);
         X_4 : IN  std_logic_vector(15 downto 0);
         Y_1 : OUT  std_logic_vector(15 downto 0);
         Y_2 : OUT  std_logic_vector(15 downto 0);
         Y_3 : OUT  std_logic_vector(15 downto 0);
         Y_4 : OUT  std_logic_vector(15 downto 0);
         READY : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLOCK : std_logic := '0';
   signal START : std_logic := '0';
   signal KEY : std_logic_vector(127 downto 0) := (others => '0');
   signal X_1 : std_logic_vector(15 downto 0) := (others => '0');
   signal X_2 : std_logic_vector(15 downto 0) := (others => '0');
   signal X_3 : std_logic_vector(15 downto 0) := (others => '0');
   signal X_4 : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal Y_1 : std_logic_vector(15 downto 0);
   signal Y_2 : std_logic_vector(15 downto 0);
   signal Y_3 : std_logic_vector(15 downto 0);
   signal Y_4 : std_logic_vector(15 downto 0);
   signal READY : std_logic;

   -- Clock period definitions
   constant CLOCK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: idea_single PORT MAP (
          CLOCK => CLOCK,
          START => START,
          KEY => KEY,
          X_1 => X_1,
          X_2 => X_2,
          X_3 => X_3,
          X_4 => X_4,
          Y_1 => Y_1,
          Y_2 => Y_2,
          Y_3 => Y_3,
          Y_4 => Y_4,
          READY => READY
        );

   -- Clock process definitions
   CLOCK_process :process
   begin
		CLOCK <= '0';
		wait for CLOCK_period/2;
		CLOCK <= '1';
		wait for CLOCK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLOCK_period*10;

      -- insert stimulus here 
      START <= '1';
      KEY <= x"00010002000300040005000600070008";
      X_1 <= x"1111";
      X_2 <= x"2222";
      X_3 <= x"4444";
      X_4 <= x"8888";
		
		wait for CLOCK_period;
		START <= '0';
		wait for CLOCK_period*12; -- algorithms takes 10 cycles to compute
		
		-- Check outputs
      assert Y_1 = x"8aa9" report "Y_1 has wrong value" severity Failure;
      assert Y_2 = x"0fef" report "Y_2 has wrong value" severity Failure;
      assert Y_3 = x"c0c9" report "Y_3 has wrong value" severity Failure;
      assert Y_4 = x"56f6" report "Y_4 has wrong value" severity Failure;
  
      -- Set inputs step 2
      START <= '1';
      KEY <= x"00000000000000000000000000000000";
      X_1 <= x"0000";
      X_2 <= x"0000";
      X_3 <= x"0000";
      X_4 <= x"0000";
      
      wait for CLOCK_period;
		START <= '0';
      wait for CLOCK_period*12;
  
      -- Check outputs
      assert Y_1 = x"0001" report "Y_1 has wrong value" severity Failure;
      assert Y_2 = x"0001" report "Y_2 has wrong value" severity Failure;
      assert Y_3 = x"0000" report "Y_3 has wrong value" severity Failure;
      assert Y_4 = x"0000" report "Y_4 has wrong value" severity Failure;
  
      -- Set inputs step 3
      START <= '1';
      KEY <= x"00010002000300040005000600070008";
      X_1 <= x"0000";
      X_2 <= x"0001";
      X_3 <= x"0002";
      X_4 <= x"0003";
      
      wait for CLOCK_period;
		START <= '0';
      wait for CLOCK_period*12;
  
      -- Check outputs
      assert Y_1 = x"11fb" report "Y_1 has wrong value" severity Failure;
      assert Y_2 = x"ed2b" report "Y_2 has wrong value" severity Failure;
      assert Y_3 = x"0198" report "Y_3 has wrong value" severity Failure;
      assert Y_4 = x"6de5" report "Y_4 has wrong value" severity Failure;
  
      -- Set inputs step 4
      START <= '1';
      KEY <= x"ffffffffffffffffffffffffffffffff";
      X_1 <= x"ffff";
      X_2 <= x"ffff";
      X_3 <= x"ffff";
      X_4 <= x"ffff";
      
      wait for CLOCK_period;
		START <= '0';
      wait for CLOCK_period*12;
  
      -- Check outputs
      assert Y_1 = x"cd1a" report "Y_1 has wrong value" severity Failure;
      assert Y_2 = x"b2c1" report "Y_2 has wrong value" severity Failure;
      assert Y_3 = x"2110" report "Y_3 has wrong value" severity Failure;
      assert Y_4 = x"41fb" report "Y_4 has wrong value" severity Failure;
      wait;
   end process;

END;
