--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:22:29 11/13/2021
-- Design Name:   
-- Module Name:   /home/ise/ise_projects/submit/direct/tb_mulop.vhd
-- Project Name:  idea
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mulop
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

ENTITY tb_mulop IS
END tb_mulop;

ARCHITECTURE behavior OF tb_mulop IS

  -- Component Declaration for the Unit Under Test (UUT)

  COMPONENT mulop
    PORT (
      I_1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      I_2 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      O_1 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
  END COMPONENT;
  --Inputs
  SIGNAL I_1 : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
  SIGNAL I_2 : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');

  --Outputs
  SIGNAL O_1 : STD_LOGIC_VECTOR(15 DOWNTO 0);

  CONSTANT I_period : TIME := 10 ns;

BEGIN

  -- Instantiate the Unit Under Test (UUT)
  uut : mulop PORT MAP(
    I_1 => I_1,
    I_2 => I_2,
    O_1 => O_1
  );

  -- Clock process definitions
  I_process : PROCESS
  BEGIN
    -- 1*1=1
    I_1 <= "0000000000000001";
    I_2 <= "0000000000000001";
    WAIT FOR I_period/2;
    -- 1*2=2
    I_1 <= "0000000000000001";
    I_2 <= "0000000000000010";
    WAIT FOR I_period/2;
    -- 4*2=8
    I_1 <= "0000000000000100";
    I_2 <= "0000000000000010";
    WAIT FOR I_period/2;
    -- 2^15 * 2 % 
    I_1 <= "1000000000000000";
    I_2 <= "0000000000000010";
    WAIT FOR I_period/2;
  END PROCESS;

END;