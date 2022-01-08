----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:03:02 12/22/2021 
-- Design Name: 
-- Module Name:    keygen - Behavioral 
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
use IEEE.NUMERIC_STD.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity keygen is
  port (
    KEYIN : in std_logic_vector(127 downto 0);
    SEL : in std_logic_vector(3 downto 0);
    PKEY1 : out std_logic_vector(15 downto 0);
    PKEY2 : out std_logic_vector(15 downto 0);
    PKEY3 : out std_logic_vector(15 downto 0);
    PKEY4 : out std_logic_vector(15 downto 0);
    PKEY5 : out std_logic_vector(15 downto 0);
    PKEY6 : out std_logic_vector(15 downto 0));
end keygen;

architecture Behavioral of keygen is
  signal TEMPKEY : std_logic_vector(127 downto 0);
  constant UNDEFINED16 : std_logic_vector(15 downto 0) := (others => 'U');

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
  SEL_PROC : process (SEL, KEYIN, TEMPKEY)
  begin
    case SEL is
      when x"0" =>
        PKEY1 <= KEYIN(127 downto 112);
        PKEY2 <= KEYIN(111 downto 96);
        PKEY3 <= KEYIN(95 downto 80);
        PKEY4 <= KEYIN(79 downto 64);
        PKEY5 <= KEYIN(63 downto 48);
        PKEY6 <= KEYIN(47 downto 32);
      when x"1" =>
        PKEY1 <= KEYIN(31 downto 16);
        PKEY2 <= KEYIN(15 downto 0);
        TEMPKEY <= vector_ror(KEYIN, 1 * 25);
        PKEY3 <= TEMPKEY(127 downto 112);
        PKEY4 <= TEMPKEY(111 downto 96);
        PKEY5 <= TEMPKEY(95 downto 80);
        PKEY6 <= TEMPKEY(79 downto 64);
      WHEN x"2" =>
        TEMPKEY <= vector_ror(KEYIN, 1 * 25);
        PKEY1 <= TEMPKEY(63 downto 48);
        PKEY2 <= TEMPKEY(47 downto 32);
        PKEY3 <= TEMPKEY(31 downto 16);
        PKEY4 <= TEMPKEY(15 downto 0);
        TEMPKEY <= vector_ror(KEYIN, 2 * 25);
        PKEY5 <= TEMPKEY(127 downto 112);
        PKEY6 <= TEMPKEY(111 downto 96);
      WHEN x"3" =>
        TEMPKEY <= vector_ror(KEYIN, 2 * 25);
        PKEY1 <= TEMPKEY(95 downto 80);
        PKEY2 <= TEMPKEY(79 downto 64);
        PKEY3 <= TEMPKEY(63 downto 48);
        PKEY4 <= TEMPKEY(47 downto 32);
        PKEY5 <= TEMPKEY(31 downto 16);
        PKEY6 <= TEMPKEY(15 downto 0);
      WHEN x"4" =>
        TEMPKEY <= vector_ror(KEYIN, 3 * 25);
        PKEY1 <= TEMPKEY(127 downto 112);
        PKEY2 <= TEMPKEY(111 downto 96);
        PKEY3 <= TEMPKEY(95 downto 80);
        PKEY4 <= TEMPKEY(79 downto 64);
        PKEY5 <= TEMPKEY(63 downto 48);
        PKEY6 <= TEMPKEY(47 downto 32);
      WHEN x"5" =>
        TEMPKEY <= vector_ror(KEYIN, 3 * 25);
        PKEY1 <= TEMPKEY(31 downto 16);
        PKEY2 <= TEMPKEY(15 downto 0);
        TEMPKEY <= vector_ror(KEYIN, 4 * 25);
        PKEY3 <= TEMPKEY(127 downto 112);
        PKEY4 <= TEMPKEY(111 downto 96);
        PKEY5 <= TEMPKEY(95 downto 80);
        PKEY6 <= TEMPKEY(79 downto 64);
      WHEN x"6" =>
        TEMPKEY <= vector_ror(KEYIN, 4 * 25);
        PKEY1 <= TEMPKEY(63 downto 48);
        PKEY2 <= TEMPKEY(47 downto 32);
        PKEY3 <= TEMPKEY(31 downto 16);
        PKEY4 <= TEMPKEY(15 downto 0);
        TEMPKEY <= vector_ror(KEYIN, 5 * 25);
        PKEY5 <= TEMPKEY(127 downto 112);
        PKEY6 <= TEMPKEY(111 downto 96);
      WHEN x"7" =>
        TEMPKEY <= vector_ror(KEYIN, 5 * 25);
        PKEY1 <= TEMPKEY(95 downto 80);
        PKEY2 <= TEMPKEY(79 downto 64);
        PKEY3 <= TEMPKEY(63 downto 48);
        PKEY4 <= TEMPKEY(47 downto 32);
        PKEY5 <= TEMPKEY(31 downto 16);
        PKEY6 <= TEMPKEY(15 downto 0);
      WHEN x"8" =>
        TEMPKEY <= vector_ror(KEYIN, 6 * 25);
        PKEY1 <= TEMPKEY(127 downto 112);
        PKEY2 <= TEMPKEY(111 downto 96);
        PKEY3 <= TEMPKEY(95 downto 80);
        PKEY4 <= TEMPKEY(79 downto 64);
        PKEY5 <= TEMPKEY(63 downto 48);
        PKEY6 <= TEMPKEY(47 downto 32);
      when others =>
        PKEY1 <= UNDEFINED16;
        PKEY2 <= UNDEFINED16;
        PKEY3 <= UNDEFINED16;
        PKEY4 <= UNDEFINED16;
        PKEY5 <= UNDEFINED16;
        PKEY6 <= UNDEFINED16;
    end case;
  end process;
end Behavioral;