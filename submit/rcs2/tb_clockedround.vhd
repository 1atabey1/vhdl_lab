--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:01:10 01/19/2022
-- Design Name:   
-- Module Name:   /home/ise/ise_projects/vhdl_lab/submit/rcs2/tb_clockedround.vhd
-- Project Name:  idea_rcs2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: clockedround
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

entity tb_clockedround is
end tb_clockedround;

architecture behavior of tb_clockedround is

  -- Component Declaration for the Unit Under Test (UUT)

  component clockedround
    port (
      CLK : in std_logic;
      INIT : in std_logic;
      TRAFO_SIG : in std_logic;
      X1 : in std_logic_vector(15 downto 0);
      X2 : in std_logic_vector(15 downto 0);
      X3 : in std_logic_vector(15 downto 0);
      X4 : in std_logic_vector(15 downto 0);
      Z1 : in std_logic_vector(15 downto 0);
      Z2 : in std_logic_vector(15 downto 0);
      Z3 : in std_logic_vector(15 downto 0);
      Z4 : in std_logic_vector(15 downto 0);
      Z5 : in std_logic_vector(15 downto 0);
      Z6 : in std_logic_vector(15 downto 0);
      Y1 : out std_logic_vector(15 downto 0);
      Y2 : out std_logic_vector(15 downto 0);
      Y3 : out std_logic_vector(15 downto 0);
      Y4 : out std_logic_vector(15 downto 0);
      RESULT : out std_logic;
      Y1_TRAFO : out std_logic_vector(15 downto 0);
      Y2_TRAFO : out std_logic_vector(15 downto 0);
      Y3_TRAFO : out std_logic_vector(15 downto 0);
      Y4_TRAFO : out std_logic_vector(15 downto 0)
    );
  end component;
  --Inputs
  signal CLK : std_logic := '0';
  signal INIT : std_logic := '0';
  signal TRAFO_SIG : std_logic := '0';
  signal X1 : std_logic_vector(15 downto 0) := (others => '0');
  signal X2 : std_logic_vector(15 downto 0) := (others => '0');
  signal X3 : std_logic_vector(15 downto 0) := (others => '0');
  signal X4 : std_logic_vector(15 downto 0) := (others => '0');
  signal Z1 : std_logic_vector(15 downto 0) := (others => '0');
  signal Z2 : std_logic_vector(15 downto 0) := (others => '0');
  signal Z3 : std_logic_vector(15 downto 0) := (others => '0');
  signal Z4 : std_logic_vector(15 downto 0) := (others => '0');
  signal Z5 : std_logic_vector(15 downto 0) := (others => '0');
  signal Z6 : std_logic_vector(15 downto 0) := (others => '0');

  --Outputs
  signal Y1 : std_logic_vector(15 downto 0);
  signal Y2 : std_logic_vector(15 downto 0);
  signal Y3 : std_logic_vector(15 downto 0);
  signal Y4 : std_logic_vector(15 downto 0);
  signal RESULT : std_logic;
  signal Y1_TRAFO : std_logic_vector(15 downto 0);
  signal Y2_TRAFO : std_logic_vector(15 downto 0);
  signal Y3_TRAFO : std_logic_vector(15 downto 0);
  signal Y4_TRAFO : std_logic_vector(15 downto 0);

  -- Clock period definitions
  constant CLK_period : time := 10 ns;

begin

  -- Instantiate the Unit Under Test (UUT)
  uut : clockedround port map(
    CLK => CLK,
    INIT => INIT,
    TRAFO_SIG => TRAFO_SIG,
    X1 => X1,
    X2 => X2,
    X3 => X3,
    X4 => X4,
    Z1 => Z1,
    Z2 => Z2,
    Z3 => Z3,
    Z4 => Z4,
    Z5 => Z5,
    Z6 => Z6,
    Y1 => Y1,
    Y2 => Y2,
    Y3 => Y3,
    Y4 => Y4,
    RESULT => RESULT,
    Y1_TRAFO => Y1_TRAFO,
    Y2_TRAFO => Y2_TRAFO,
    Y3_TRAFO => Y3_TRAFO,
    Y4_TRAFO => Y4_TRAFO
  );

  -- Clock process definitions
  CLK_process : process
  begin
    CLK <= '0';
    wait for CLK_period/2;
    CLK <= '1';
    wait for CLK_period/2;
  end process;
  -- Stimulus process
  stim_proc : process
  begin
    -- hold reset state for 100 ns.
    wait for 100 ns;

    INIT <= '1';
    TRAFO_SIG <= '0';

    wait for CLK_period;

    INIT <= '0';

    X1 <= x"0000";
    X2 <= x"0000";
    X3 <= x"0000";
    X4 <= x"0000";
    Z1 <= x"0000";
    Z2 <= x"0000";
    Z3 <= x"0000";
    Z4 <= x"0000";
    Z5 <= x"0000";
    Z6 <= x"0000";

    wait;
  end process;

end;