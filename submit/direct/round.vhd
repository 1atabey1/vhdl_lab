----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:12:49 11/21/2021 
-- Design Name: 
-- Module Name:    round - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity round is
  port (
    X1 : in std_logic_vector (15 downto 0);
    X2 : in std_logic_vector (15 downto 0);
    X3 : in std_logic_vector (15 downto 0);
    X4 : in std_logic_vector (15 downto 0);
    Z1 : in std_logic_vector (15 downto 0);
    Z2 : in std_logic_vector (15 downto 0);
    Z3 : in std_logic_vector (15 downto 0);
    Z4 : in std_logic_vector (15 downto 0);
    Z5 : in std_logic_vector (15 downto 0);
    Z6 : in std_logic_vector (15 downto 0);
    Y1 : out std_logic_vector (15 downto 0);
    Y2 : out std_logic_vector (15 downto 0);
    Y3 : out std_logic_vector (15 downto 0);
    Y4 : out std_logic_vector (15 downto 0));
end round;

architecture Structure of round is
  -- components
  component addop
    port (
      I_1 : in std_logic_vector(15 downto 0);
      I_2 : in std_logic_vector(15 downto 0);
      O_1 : out std_logic_vector(15 downto 0)
    );
  end component;
  component mulop
    port (
      I_1 : in std_logic_vector(15 downto 0);
      I_2 : in std_logic_vector(15 downto 0);
      O_1 : out std_logic_vector(15 downto 0)
    );
  end component;
  component xorop
    port (
      I_1 : in std_logic_vector(15 downto 0);
      I_2 : in std_logic_vector(15 downto 0);
      O_1 : out std_logic_vector(15 downto 0)
    );
  end component;

  -- internal signals
  signal mul1_out : std_logic_vector(15 downto 0);
  signal mul2_out : std_logic_vector(15 downto 0);
  signal mul3_out : std_logic_vector(15 downto 0);
  signal add1_out : std_logic_vector(15 downto 0);
  signal add2_out : std_logic_vector(15 downto 0);
  signal add3_out : std_logic_vector(15 downto 0);
  signal add4_out : std_logic_vector(15 downto 0);
  signal add5_out : std_logic_vector(15 downto 0);
  signal xor1_out : std_logic_vector(15 downto 0);
  signal xor2_out : std_logic_vector(15 downto 0);
  
begin
  -- instantiate components
  -- first layer
  mul1 : mulop
    port map (
      I_1 => X1,
      I_2 => X2,
      O_1 => mul1_out
    );
  add1 : addop port map(
    I_1 => X2,
    I_2 => Z2,
    O_1 => add1_out
  );
  add2 : addop port map(
    I_1 => X3,
    I_2 => Z3,
    O_1 => add2_out
  );
  mul2 : mulop port map(
    I_1 => X4,
    I_2 => X4,
    O_1 => mul2_out
  );
  -- second layer
  xor1 : xorop port map(
    I_1 => mul1_out,
    I_2 => add2_out,
    O_1 => xor1_out
  );
  xor2 : xorop port map(
    I_1 => mul2_out,
    I_2 => add1_out,
    O_1 => xor2_out
  );
  -- third layer
  mul3 : mulop port map(
    I_1 => xor1_out,
    I_2 => Z5,
    O_1 => mul3_out
  );
  add3  : addop port map(
    I_1 => xor2_out,
    I_2 => mul3_out,
    O_1 => add3_out
  );
  add5 : addop port map(
    I_1 => add3_out,
    I_2 => Z6,
    O_1 => add5_out
  );
  add4 : addop port map(
    I_1 => mul3_out,
    I_2 => add5_out,
    O_1 => add4_out
  );
  -- fourth layer
  xor3 : xorop port map(
    I_1 => add2_out,
    I_2 => add5_out,
    O_1 => Y2
  );
  xor4 : xorop port map(
    I_1 => mul1_out,
    I_2 => add5_out,
    O_1 => Y1
  );
  xor5 : xorop port map(
    I_1 => mul2_out,
    I_2 => add4_out,
    O_1 => Y4
  );
  xor6 : xorop port map(
    I_1 => Z5,
    I_2 => add4_out,
    O_1 => Y3
  );
end Structure;