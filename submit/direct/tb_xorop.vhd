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
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_xorop is
end tb_xorop;

architecture behavior of tb_xorop is

  -- Component Declaration for the Unit Under Test (UUT)

  component xorop
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
  uut : xorop port map(
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

    wait for 100 ns; -- wait to settle

    I_1 <= x"1234";
    I_2 <= x"5678";

    wait for 100 ns; -- wait to settle
    I_2 <= x"0000";

    wait; -- will wait forever
  end process tb;
  --  End Test Bench 
end;