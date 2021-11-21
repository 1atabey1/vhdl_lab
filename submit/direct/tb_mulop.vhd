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
library ieee;
use ieee.std_logic_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;

entity tb_mulop is
end tb_mulop;

architecture behavior of tb_mulop is

  -- Component Declaration for the Unit Under Test (UUT)

  component mulop
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

begin

  -- Instantiate the Unit Under Test (UUT)
  uut : mulop port map(
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

    wait for 100 ns; -- time to settle

    I_1 <= x"0001";
    I_2 <= x"0000";

    wait for 100 ns; -- time to settle

    I_1 <= x"0001";
    I_2 <= x"0001";

    wait for 100 ns; -- time to settle

    I_1 <= x"0003";
    I_2 <= x"0001";

    wait for 100 ns; -- time to settle

    I_1 <= x"0003";
    I_2 <= x"0003";

    wait for 100 ns; -- time to settle

    I_1 <= x"7fff";
    I_2 <= x"0003";

    wait for 100 ns; -- time to settle

    I_1 <= x"7fff";
    I_2 <= x"7fff";

    wait for 100 ns; -- time to settle

    I_1 <= x"ffff";
    I_2 <= x"7fff";

    wait for 100 ns; -- time to settle

    I_1 <= x"ffff";
    I_2 <= x"ffff";

    wait for 100 ns; -- time to settle

    I_1 <= x"8000";
    I_2 <= x"ffff";

    wait for 100 ns; -- time to settle

    I_1 <= x"8000";
    I_2 <= x"8000";

    wait; -- will wait forever
  end process tb;
  --  End Test Bench 

end;