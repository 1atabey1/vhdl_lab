----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:15:47 04/19/2016 
-- Design Name: 
-- Module Name:    clockedround - Structural 
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

entity clockedround is
  port (
    CLK : in std_logic;
    INIT : in std_logic;
    TRAFO_SIG : in std_logic;
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
    Y4 : out std_logic_vector (15 downto 0);
    RESULT : out std_logic;
    Y1_TRAFO : out std_logic_vector (15 downto 0);
    Y2_TRAFO : out std_logic_vector (15 downto 0);
    Y3_TRAFO : out std_logic_vector (15 downto 0);
    Y4_TRAFO : out std_logic_vector (15 downto 0));
end clockedround;

architecture Structural of clockedround is
  component control is
    port (
      CLK : in std_logic;
      INIT : in std_logic;
      TRAFO_SIG : in std_logic;
      EN125 : out std_logic;
      EN346 : out std_logic;
      EN78 : out std_logic;
      RESULT : out std_logic;
      S : out std_logic_vector(1 downto 0));
  end component;
  component datapath is
    port (
      CLK : in std_logic;
      S : in std_logic_vector(1 downto 0);
      EN125 : in std_logic;
      EN346 : in std_logic;
      EN78 : in std_logic;
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
      Y4 : out std_logic_vector(15 downto 0));
  end component;

  component TRAFO is
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
      Y4 : out std_logic_vector (15 downto 0));
  end component;

  signal EN125 : std_logic;
  signal EN346 : std_logic;
  signal EN78 : std_logic;
  signal S : std_logic_vector(1 downto 0);
begin
  controller : control
  port map(
    CLK => CLK,
    INIT => INIT,
    TRAFO_SIG => TRAFO_SIG,
    EN125 => EN125,
    EN346 => EN346,
    EN78 => EN78,
    RESULT => RESULT,
    S => S);

  data : datapath
  port map(
    CLK => CLK,
    S => S,
    EN125 => EN125,
    EN346 => EN346,
    EN78 => EN78,
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
    Y4 => Y4);

  trafo1 : TRAFO
  port map(
    X1 => X1,
    X2 => X2,
    X3 => X3,
    X4 => X4,
    Z1 => Z1,
    Z2 => Z2,
    Z3 => Z3,
    Z4 => Z4,
    Y1 => Y1_TRAFO,
    Y2 => Y2_TRAFO,
    Y3 => Y3_TRAFO,
    Y4 => Y4_TRAFO
  );

end Structural;