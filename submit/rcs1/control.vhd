----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:     
-- Design Name: 
-- Module Name:    control - Behavioral 
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

entity control is
  port (
    CLK : in std_logic;
    START : in std_logic;
    ROUND : out std_logic_vector (3 downto 0);
    READY : out std_logic;
    EN : out std_logic;
    S : out std_logic);
end control;

architecture Behavioral of control is

  function incr_mod8(in_vector : std_logic_vector) return std_logic_vector is
    variable result : std_logic_vector(3 downto 0);
    variable carry : std_logic;
    variable i : integer := 0;
    variable addend : std_logic_vector(3 downto 0) := "0001";
  begin
    if in_vector = "1000" then
      -- start over if input is 8
      result := "0000";
    else
      -- always just add 1
      carry := '0';
      for i in 0 to 3 loop
        result(i) := (in_vector(i) xor addend(i)) xor carry;
        carry := (in_vector(i) and addend(i)) or (carry and addend(i)) or (in_vector(i) and carry);
      end loop;
    end if;
    return result;
  end incr_mod8;

begin
  process (CLK)
    variable curr_round : std_logic_vector (3 downto 0) := "1000";
    variable is_started : std_logic := '0';
    variable is_running : std_logic := '0';
  begin
    if rising_edge(CLK) then

      if is_started = '1' then
        S <= '0';
        is_started := '0';
        is_running := '1';
      else
        S <= '1';
      end if;

      if is_running = '1' then
        READY <= '0';
        EN <= '1';
        curr_round := incr_mod8(curr_round);
        ROUND <= curr_round;
        if curr_round = "1000" then
          is_running := '0';
          READY <= '1';
          EN <= '0';
        end if;
      else
        READY <= '1';
        EN <= '0';
        ROUND <= curr_round;
      end if;

      if START = '1' and is_running = '0' then
        is_started := '1';
      end if;

    end if;
  end process;
end Behavioral;