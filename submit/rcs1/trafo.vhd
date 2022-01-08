----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:08:17 11/21/2021 
-- Design Name: 
-- Module Name:    trafo - Behavioral 
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

entity trafo is
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
end trafo;

architecture Structure of trafo is
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
begin
  mul1 : mulop
  port map(
    I_1 => X1,
    I_2 => Z1,
    O_1 => Y1
  );
  add1 : addop
  port map(
    I_1 => Z2,
    I_2 => X3,
    O_1 => Y2
  );
  add2 : addop
  port map(
    I_1 => Z3,
    I_2 => X2,
    O_1 => Y3
  );
  mul2 : mulop
  port map(
    I_1 => X4,
    I_2 => Z4,
    O_1 => Y4
  );
end Structure;