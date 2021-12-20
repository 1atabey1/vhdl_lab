--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:23:41 11/27/2021
-- Design Name:   
-- Module Name:   /home/ise/ise_projects/vhdl_lab/submit/direct/tb_idea.vhd
-- Project Name:  idea
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: idea
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

entity tb_idea is
end tb_idea;

architecture behavior of tb_idea is

  -- Component Declaration for the Unit Under Test (UUT)

  component idea
    port (
      KEY : in std_logic_vector(127 downto 0);
      X_1 : in std_logic_vector(15 downto 0);
      X_2 : in std_logic_vector(15 downto 0);
      X_3 : in std_logic_vector(15 downto 0);
      X_4 : in std_logic_vector(15 downto 0);
      Y_1 : out std_logic_vector(15 downto 0);
      Y_2 : out std_logic_vector(15 downto 0);
      Y_3 : out std_logic_vector(15 downto 0);
      Y_4 : out std_logic_vector(15 downto 0)
    );
  end component;
  --Inputs
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

begin

  -- Instantiate the Unit Under Test (UUT)
  uut : idea port map(
    KEY => KEY,
    X_1 => X_1,
    X_2 => X_2,
    X_3 => X_3,
    X_4 => X_4,
    Y_1 => Y_1,
    Y_2 => Y_2,
    Y_3 => Y_3,
    Y_4 => Y_4
  );

  --  Test Bench Statements
  tb : process
  begin

    wait for 100 ns; -- wait until global set/reset completes

    X_1 <= x"1111";
    X_2 <= x"2222";
    X_3 <= x"4444";
    X_4 <= x"8888";
    KEY <= x"00010002000300040005000600070008";

    wait for 100 ns; -- time to settle

    -- Check outputs
    assert Y_1 = x"8aa9" report "Y_1 has wrong value" severity Failure;
    assert Y_2 = x"0fef" report "Y_2 has wrong value" severity Failure;
    assert Y_3 = x"c0c9" report "Y_3 has wrong value" severity Failure;
    assert Y_4 = x"56f6" report "Y_4 has wrong value" severity Failure;

    -- Set inputs step 2
    KEY <= x"00000000000000000000000000000000";
    X_1 <= x"0000";
    X_2 <= x"0000";
    X_3 <= x"0000";
    X_4 <= x"0000";

    wait for 100 ns; -- time to settle

    -- Check outputs
    assert Y_1 = x"0001" report "Y_1 has wrong value" severity Failure;
    assert Y_2 = x"0001" report "Y_2 has wrong value" severity Failure;
    assert Y_3 = x"0000" report "Y_3 has wrong value" severity Failure;
    assert Y_4 = x"0000" report "Y_4 has wrong value" severity Failure;

    -- Set inputs step 3
    KEY <= x"00010002000300040005000600070008";
    X_1 <= x"0000";
    X_2 <= x"0001";
    X_3 <= x"0002";
    X_4 <= x"0003";

    wait for 100 ns; -- time to settle

    -- Check outputs
    assert Y_1 = x"11fb" report "Y_1 has wrong value" severity Failure;
    assert Y_2 = x"ed2b" report "Y_2 has wrong value" severity Failure;
    assert Y_3 = x"0198" report "Y_3 has wrong value" severity Failure;
    assert Y_4 = x"6de5" report "Y_4 has wrong value" severity Failure;

    -- Set inputs step 4
    KEY <= x"ffffffffffffffffffffffffffffffff";
    X_1 <= x"ffff";
    X_2 <= x"ffff";
    X_3 <= x"ffff";
    X_4 <= x"ffff";

    wait for 100 ns; -- time to settle

    -- Check outputs
    assert Y_1 = x"cd1a" report "Y_1 has wrong value" severity Failure;
    assert Y_2 = x"b2c1" report "Y_2 has wrong value" severity Failure;
    assert Y_3 = x"2110" report "Y_3 has wrong value" severity Failure;
    assert Y_4 = x"41fb" report "Y_4 has wrong value" severity Failure;

    wait; -- will wait forever
  end process tb;
  --  End Test Bench 

end;