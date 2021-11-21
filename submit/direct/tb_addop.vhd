--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:54:18 11/13/2021
-- Design Name:   
-- Module Name:   /home/ise/ise_projects/submit/direct/tb_addop.vhd
-- Project Name:  idea
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: addop
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
library ieee;
use ieee.std_logic_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;

entity tb_addop is
end tb_addop;

architecture behavior of tb_addop is

  -- Component Declaration for the Unit Under Test (UUT)

  component addop
    port (
      I_1 : in std_logic_vector(15 downto 0);
      I_2 : in std_logic_vector(15 downto 0);
      O_1 : out std_logic_vector(15 downto 0)
    );
  end component;
  --Inputs
  signal I_1 : std_logic_vector(15 downto 0) := (others => '0');
  signal I_2 : std_logic_vector(15 downto 0) := (others => '0');

  --Outputs
  signal O_1 : std_logic_vector(15 downto 0);

  constant I_period : time := 100 ns;

begin

  -- Instantiate the Unit Under Test (UUT)
  uut : addop port map(
    I_1 => I_1,
    I_2 => I_2,
    O_1 => O_1
  );

  --  Test Bench Statements
  tb : process
  begin

    wait for 100 ns; -- wait until global set/reset completes

    I_1 <= x"0000";
    I_2 <= x"0000";

    wait for 100 ns; -- wait to allow signals to settle

    I_1 <= x"7ce3";
    I_2 <= x"0000";

    wait for 100 ns; -- wait to allow signals to settle

    I_2 <= x"2db6";

    wait for 100 ns; -- wait to allow signals to settle

    I_1 <= x"fce3";

    wait for 100 ns; -- wait to allow signals to settle

    I_2 <= x"edb6";

    wait for 100 ns; -- wait to allow signals to settle

    I_1 <= x"7ce3";

    wait; -- will wait forever
  end process tb;
  --  End Test Bench 

end;