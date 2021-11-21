--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:08:32 11/21/2021
-- Design Name:   
-- Module Name:   /home/ise/ise_projects/vhdl_lab/submit/direct/tb_trafo.vhd
-- Project Name:  idea
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: trafo
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

entity tb_trafo is
end tb_trafo;

architecture behavior of tb_trafo is

  -- Component Declaration for the Unit Under Test (UUT)

  component trafo
    port (
      X1 : in std_logic_vector (15 downto 0);
      X2 : in std_logic_vector (15 downto 0);
      X3 : in std_logic_vector (15 downto 0);
      X4 : in std_logic_vector (15 downto 0);
      Z1 : in std_logic_vector (15 downto 0);
      Z2 : in std_logic_vector (15 downto 0);
      Z3 : in std_logic_vector (15 downto 0);
      Z4 : in std_logic_vector (15 downto 0);
      Y1 : out std_logic_vector (15 downto 0);
      Y2 : out std_logic_vector (15 downto 0);
      Y3 : out std_logic_vector (15 downto 0);
      Y4 : out std_logic_vector (15 downto 0)
    );
  end component;

  --Inputs
  signal X1 : std_logic_vector (15 downto 0) := (others => '0');
  signal X2 : std_logic_vector (15 downto 0) := (others => '0');
  signal X3 : std_logic_vector (15 downto 0) := (others => '0');
  signal X4 : std_logic_vector (15 downto 0) := (others => '0');
  signal Z1 : std_logic_vector (15 downto 0) := (others => '0');
  signal Z2 : std_logic_vector (15 downto 0) := (others => '0');
  signal Z3 : std_logic_vector (15 downto 0) := (others => '0');
  signal Z4 : std_logic_vector (15 downto 0) := (others => '0');

  --Outputs
  signal Y1 : std_logic_vector (15 downto 0);
  signal Y2 : std_logic_vector (15 downto 0);
  signal Y3 : std_logic_vector (15 downto 0);
  signal Y4 : std_logic_vector (15 downto 0);

begin

  -- Instantiate the Unit Under Test (UUT)
  uut : trafo port map(
    X1 => X1,
    X2 => X2,
    X3 => X3,
    X4 => X4,
    Z1 => Z1,
    Z2 => Z2,
    Z3 => Z3,
    Z4 => Z4,
    Y1 => Y1,
    Y2 => Y2,
    Y3 => Y3,
    Y4 => Y4
  );

  --  Test Bench Statements
  tb : process
  begin

    wait for 100 ns; -- wait until global set/reset completes

    X1 <= x"ffff";

    wait for 100 ns; -- time to settle

    X2 <= x"aaaa";

    wait for 100 ns; -- time to settle

    X3 <= x"5555";

    wait for 100 ns; -- time to settle

    X4 <= x"2492";

    wait for 100 ns; -- time to settle

    Z1 <= x"db6d";

    wait for 100 ns; -- time to settle

    Z2 <= x"1c71";

    wait for 100 ns; -- time to settle

    Z3 <= x"cccc";

    wait for 100 ns; -- time to settle

    Z4 <= x"0002";

    wait; -- will wait forever
  end process tb;
  --  End Test Bench 

end;