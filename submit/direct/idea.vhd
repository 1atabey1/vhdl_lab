----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:     
-- Design Name: 
-- Module Name:    idea - Structural 
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
use IEEE.NUMERIC_STD.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity idea is
  port (
    KEY : in std_logic_vector (127 downto 0);
    X_1 : in std_logic_vector (15 downto 0);
    X_2 : in std_logic_vector (15 downto 0);
    X_3 : in std_logic_vector (15 downto 0);
    X_4 : in std_logic_vector (15 downto 0);
    Y_1 : out std_logic_vector (15 downto 0);
    Y_2 : out std_logic_vector (15 downto 0);
    Y_3 : out std_logic_vector (15 downto 0);
    Y_4 : out std_logic_vector (15 downto 0));
end idea;

architecture Structural of idea is
  -- components
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
      Y4 : out std_logic_vector (15 downto 0)
    );
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

  -- internal signals
  signal rd_key : std_logic_vector (767 downto 0);
  signal trafo_key : std_logic_vector (127 downto 0);

  signal rd1_Y1 : std_logic_vector (15 downto 0);
  signal rd1_Y2 : std_logic_vector (15 downto 0);
  signal rd1_Y3 : std_logic_vector (15 downto 0);
  signal rd1_Y4 : std_logic_vector (15 downto 0);

  signal rd2_Y1 : std_logic_vector (15 downto 0);
  signal rd2_Y2 : std_logic_vector (15 downto 0);
  signal rd2_Y3 : std_logic_vector (15 downto 0);
  signal rd2_Y4 : std_logic_vector (15 downto 0);

  signal rd3_Y1 : std_logic_vector (15 downto 0);
  signal rd3_Y2 : std_logic_vector (15 downto 0);
  signal rd3_Y3 : std_logic_vector (15 downto 0);
  signal rd3_Y4 : std_logic_vector (15 downto 0);

  signal rd4_Y1 : std_logic_vector (15 downto 0);
  signal rd4_Y2 : std_logic_vector (15 downto 0);
  signal rd4_Y3 : std_logic_vector (15 downto 0);
  signal rd4_Y4 : std_logic_vector (15 downto 0);

  signal rd5_Y1 : std_logic_vector (15 downto 0);
  signal rd5_Y2 : std_logic_vector (15 downto 0);
  signal rd5_Y3 : std_logic_vector (15 downto 0);
  signal rd5_Y4 : std_logic_vector (15 downto 0);

  signal rd6_Y1 : std_logic_vector (15 downto 0);
  signal rd6_Y2 : std_logic_vector (15 downto 0);
  signal rd6_Y3 : std_logic_vector (15 downto 0);
  signal rd6_Y4 : std_logic_vector (15 downto 0);

  signal rd7_Y1 : std_logic_vector (15 downto 0);
  signal rd7_Y2 : std_logic_vector (15 downto 0);
  signal rd7_Y3 : std_logic_vector (15 downto 0);
  signal rd7_Y4 : std_logic_vector (15 downto 0);

  signal rd8_Y1 : std_logic_vector (15 downto 0);
  signal rd8_Y2 : std_logic_vector (15 downto 0);
  signal rd8_Y3 : std_logic_vector (15 downto 0);
  signal rd8_Y4 : std_logic_vector (15 downto 0);

  function vector_ror (
    value : std_logic_vector(127 downto 0);
    shift : integer)
    return std_logic_vector is
    variable shift_vaL_scaled : integer;
  begin
    shift_vaL_scaled := shift mod 128;
    return value((127 - shift_vaL_scaled) downto 0) & value(127 downto (127 - shift_vaL_scaled + 1));
  end function;

begin
  -- construct partial keys
  trafo_key <= vector_ror(KEY, 6 * 25);
  rd_key(127 downto 0) <= vector_ror(KEY, 5 * 25);
  rd_key(255 downto 128) <= vector_ror(KEY, 4 * 25);
  rd_key(383 downto 256) <= vector_ror(KEY, 3 * 25);
  rd_key(511 downto 384) <= vector_ror(KEY, 2 * 25);
  rd_key(639 downto 512) <= vector_ror(KEY, 1 * 25);
  rd_key(767 downto 640) <= KEY;

  -- instantiate components
  rd1 : round
  port map(
    X1 => X_1,
    X2 => X_2,
    X3 => X_3,
    X4 => X_4,
    Z1 => rd_key(767 downto 752),
    Z2 => rd_key(751 downto 736),
    Z3 => rd_key(735 downto 720),
    Z4 => rd_key(719 downto 704),
    Z5 => rd_key(703 downto 688),
    Z6 => rd_key(687 downto 672),
    Y1 => rd1_Y1,
    Y2 => rd1_Y2,
    Y3 => rd1_Y3,
    Y4 => rd1_Y4
  );
  rd2 : round
  port map(
    X1 => rd1_Y1,
    X2 => rd1_Y2,
    X3 => rd1_Y3,
    X4 => rd1_Y4,
    Z1 => rd_key(671 downto 656),
    Z2 => rd_key(655 downto 640),
    Z3 => rd_key(639 downto 624),
    Z4 => rd_key(623 downto 608),
    Z5 => rd_key(607 downto 592),
    Z6 => rd_key(591 downto 576),
    Y1 => rd2_Y1,
    Y2 => rd2_Y2,
    Y3 => rd2_Y3,
    Y4 => rd2_Y4
  );
  rd3 : round
  port map(
    X1 => rd2_Y1,
    X2 => rd2_Y2,
    X3 => rd2_Y3,
    X4 => rd2_Y4,
    Z1 => rd_key(575 downto 560),
    Z2 => rd_key(559 downto 544),
    Z3 => rd_key(543 downto 528),
    Z4 => rd_key(527 downto 512),
    Z5 => rd_key(511 downto 496),
    Z6 => rd_key(495 downto 480),
    Y1 => rd3_Y1,
    Y2 => rd3_Y2,
    Y3 => rd3_Y3,
    Y4 => rd3_Y4
  );
  rd4 : round
  port map(
    X1 => rd3_Y1,
    X2 => rd3_Y2,
    X3 => rd3_Y3,
    X4 => rd3_Y4,
    Z1 => rd_key(479 downto 464),
    Z2 => rd_key(463 downto 448),
    Z3 => rd_key(447 downto 432),
    Z4 => rd_key(431 downto 416),
    Z5 => rd_key(415 downto 400),
    Z6 => rd_key(399 downto 384),
    Y1 => rd4_Y1,
    Y2 => rd4_Y2,
    Y3 => rd4_Y3,
    Y4 => rd4_Y4
  );
  rd5 : round
  port map(
    X1 => rd4_Y1,
    X2 => rd4_Y2,
    X3 => rd4_Y3,
    X4 => rd4_Y4,
    Z1 => rd_key(383 downto 368),
    Z2 => rd_key(367 downto 352),
    Z3 => rd_key(351 downto 336),
    Z4 => rd_key(335 downto 320),
    Z5 => rd_key(319 downto 304),
    Z6 => rd_key(303 downto 288),
    Y1 => rd5_Y1,
    Y2 => rd5_Y2,
    Y3 => rd5_Y3,
    Y4 => rd5_Y4
  );
  rd6 : round
  port map(
    X1 => rd5_Y1,
    X2 => rd5_Y2,
    X3 => rd5_Y3,
    X4 => rd5_Y4,
    Z1 => rd_key(287 downto 272),
    Z2 => rd_key(271 downto 256),
    Z3 => rd_key(255 downto 240),
    Z4 => rd_key(239 downto 224),
    Z5 => rd_key(223 downto 208),
    Z6 => rd_key(207 downto 192),
    Y1 => rd6_Y1,
    Y2 => rd6_Y2,
    Y3 => rd6_Y3,
    Y4 => rd6_Y4
  );
  rd7 : round
  port map(
    X1 => rd6_Y1,
    X2 => rd6_Y2,
    X3 => rd6_Y3,
    X4 => rd6_Y4,
    Z1 => rd_key(191 downto 176),
    Z2 => rd_key(175 downto 160),
    Z3 => rd_key(159 downto 144),
    Z4 => rd_key(143 downto 128),
    Z5 => rd_key(127 downto 112),
    Z6 => rd_key(111 downto 96),
    Y1 => rd7_Y1,
    Y2 => rd7_Y2,
    Y3 => rd7_Y3,
    Y4 => rd7_Y4
  );
  rd8 : round
  port map(
    X1 => rd7_Y1,
    X2 => rd7_Y2,
    X3 => rd7_Y3,
    X4 => rd7_Y4,
    Z1 => rd_key(95 downto 80),
    Z2 => rd_key(79 downto 64),
    Z3 => rd_key(63 downto 48),
    Z4 => rd_key(47 downto 32),
    Z5 => rd_key(31 downto 16),
    Z6 => rd_key(15 downto 0),
    Y1 => rd8_Y1,
    Y2 => rd8_Y2,
    Y3 => rd8_Y3,
    Y4 => rd8_Y4
  );
  trafo1 : trafo
  port map(
    X1 => rd8_Y1,
    X2 => rd8_Y2,
    X3 => rd8_Y3,
    X4 => rd8_Y4,
    Z1 => trafo_key(127 downto 112),
    Z2 => trafo_key(111 downto 96),
    Z3 => trafo_key(95 downto 80),
    Z4 => trafo_key(79 downto 64),
    Y1 => Y_1,
    Y2 => Y_2,
    Y3 => Y_3,
    Y4 => Y_4
  );
end Structural;