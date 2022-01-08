----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:     
-- Design Name: 
-- Module Name:    idea_single - Structural 
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

entity idea_single is
  port (
    CLOCK : in std_logic;
    START : in std_logic;
    KEY : in std_logic_vector (127 downto 0);
    X_1 : in std_logic_vector (15 downto 0);
    X_2 : in std_logic_vector (15 downto 0);
    X_3 : in std_logic_vector (15 downto 0);
    X_4 : in std_logic_vector (15 downto 0);
    Y_1 : out std_logic_vector (15 downto 0);
    Y_2 : out std_logic_vector (15 downto 0);
    Y_3 : out std_logic_vector (15 downto 0);
    Y_4 : out std_logic_vector (15 downto 0);
    READY : out std_logic);
end idea_single;

architecture Structural of idea_single is
  -- internal signals
  signal muxxer : std_logic;
  signal reg_enable : std_logic;
  signal current_round : std_logic_vector(3 downto 0);
  signal m1_out : std_logic_vector(15 downto 0);
  signal m2_out : std_logic_vector(15 downto 0);
  signal m3_out : std_logic_vector(15 downto 0);
  signal m4_out : std_logic_vector(15 downto 0);
  signal round_out1 : std_logic_vector(15 downto 0);
  signal round_out2 : std_logic_vector(15 downto 0);
  signal round_out3 : std_logic_vector(15 downto 0);
  signal round_out4 : std_logic_vector(15 downto 0);
  signal r1_out : std_logic_vector(15 downto 0);
  signal r2_out : std_logic_vector(15 downto 0);
  signal r3_out : std_logic_vector(15 downto 0);
  signal r4_out : std_logic_vector(15 downto 0);
  signal pkey1 : std_logic_vector(15 downto 0);
  signal pkey2 : std_logic_vector(15 downto 0);
  signal pkey3 : std_logic_vector(15 downto 0);
  signal pkey4 : std_logic_vector(15 downto 0);
  signal pkey5 : std_logic_vector(15 downto 0);
  signal pkey6 : std_logic_vector(15 downto 0);

  component control
    port (
      CLK : in std_logic;
      START : in std_logic;
      ROUND : out std_logic_vector (3 downto 0);
      READY : out std_logic;
      EN : out std_logic;
      S : out std_logic);
  end component;

  component keygen
    port (
      KEYIN : in std_logic_vector(127 downto 0);
      SEL : in std_logic_vector(3 downto 0);
      PKEY1 : out std_logic_vector(15 downto 0);
      PKEY2 : out std_logic_vector(15 downto 0);
      PKEY3 : out std_logic_vector(15 downto 0);
      PKEY4 : out std_logic_vector(15 downto 0);
      PKEY5 : out std_logic_vector(15 downto 0);
      PKEY6 : out std_logic_vector(15 downto 0));
  end component;

  component REG
    port (
      CLK : in std_logic;
      EN : in std_logic;
      D : in std_logic_vector(15 downto 0);
      Q : out std_logic_vector(15 downto 0)
    );
  end component;

  component mux2x1
    port (
      S : in std_logic;
      D0 : in std_logic_vector(15 downto 0);
      D1 : in std_logic_vector(15 downto 0);
      Q : out std_logic_vector(15 downto 0));
  end component;

  component round
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
  end component;

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

begin
  -- input multiplexers
  mux1 : mux2x1
  port map(
    S => muxxer,
    D0 => X_1,
    D1 => r1_out,
    Q => m1_out);

  mux2 : mux2x1
  port map(
    S => muxxer,
    D0 => X_2,
    D1 => r2_out,
    Q => m2_out);

  mux3 : mux2x1
  port map(
    S => muxxer,
    D0 => X_3,
    D1 => r3_out,
    Q => m3_out);

  mux4 : mux2x1
  port map(
    S => muxxer,
    D0 => X_4,
    D1 => r4_out,
    Q => m4_out);

  -- output registers
  r1 : REG
  port map(
    CLK => CLOCK,
    EN => reg_enable,
    D => round_out1,
    Q => r1_out);

  r2 : REG
  port map(
    CLK => CLOCK,
    EN => reg_enable,
    D => round_out2,
    Q => r2_out);

  r3 : REG
  port map(
    CLK => CLOCK,
    EN => reg_enable,
    D => round_out3,
    Q => r3_out);

  r4 : REG
  port map(
    CLK => CLOCK,
    EN => reg_enable,
    D => round_out4,
    Q => r4_out);

  -- control unit
  ctrl : control
  port map(
    CLK => CLOCK,
    START => START,
    ROUND => current_round,
    READY => READY,
    EN => reg_enable,
    S => muxxer);

  -- key generator
  keygenerator : keygen
  port map(
    KEYIN => KEY,
    SEL => current_round,
    PKEY1 => pkey1,
    PKEY2 => pkey2,
    PKEY3 => pkey3,
    PKEY4 => pkey4,
    PKEY5 => pkey5,
    PKEY6 => pkey6);

  -- round module
  round1 : round
  port map(
    X1 => m1_out,
    X2 => m2_out,
    X3 => m3_out,
    X4 => m4_out,
    Z1 => pkey1,
    Z2 => pkey2,
    Z3 => pkey3,
    Z4 => pkey4,
    Z5 => pkey5,
    Z6 => pkey6,
    Y1 => round_out1,
    Y2 => round_out2,
    Y3 => round_out3,
    Y4 => round_out4);

  -- output transformation
  trafo1 : trafo
  port map(
    X1 => r1_out,
    X2 => r2_out,
    X3 => r3_out,
    X4 => r4_out,
    Z1 => pkey1,
    Z2 => pkey2,
    Z3 => pkey3,
    Z4 => pkey4,
    Y1 => Y_1,
    Y2 => Y_2,
    Y3 => Y_3,
    Y4 => Y_4);

end Structural;