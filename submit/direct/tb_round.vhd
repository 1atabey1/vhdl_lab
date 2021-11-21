-- TestBench Template 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench is
end testbench;

architecture behavior of testbench is

  -- Component Declaration
  component round
    port (
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
      Y4 : out std_logic_vector(15 downto 0)
    );
  end component;

  -- signals
  signal X1 : std_logic_vector(15 downto 0);
  signal X2 : std_logic_vector(15 downto 0);
  signal X3 : std_logic_vector(15 downto 0);
  signal X4 : std_logic_vector(15 downto 0);
  signal Z1 : std_logic_vector(15 downto 0);
  signal Z2 : std_logic_vector(15 downto 0);
  signal Z3 : std_logic_vector(15 downto 0);
  signal Z4 : std_logic_vector(15 downto 0);
  signal Z5 : std_logic_vector(15 downto 0);
  signal Z6 : std_logic_vector(15 downto 0);
  signal Y1 : std_logic_vector(15 downto 0);
  signal Y2 : std_logic_vector(15 downto 0);
  signal Y3 : std_logic_vector(15 downto 0);
  signal Y4 : std_logic_vector(15 downto 0);
begin

  -- Component Instantiation
  uut : round port map(
    X1, X2, X3, X4, Z1, Z2, Z3, Z4, Z5, Z6, Y1, Y2, Y3, Y4
  );
  --  Test Bench Statements
  tb : process
  begin

    wait for 100 ns; -- wait until global set/reset completes

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

    wait for 100 ns; -- time to settle

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
	 
	 wait for 100 ns; -- time to settle

    Z5 <= x"eeee";
	 
	 wait for 100 ns; -- time to settle

    Z6 <= x"8888";
	 
    wait; -- will wait forever
  end process tb;
  --  End Test Bench 

end;