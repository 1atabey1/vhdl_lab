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
use IEEE.STD_LOGIC_UNSIGNED.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity control is
  port (
    CLK : in std_logic;
    INIT : in std_logic;
    TRAFO_SIG : in std_logic;
    EN125 : out std_logic;
    EN346 : out std_logic;
    EN78 : out std_logic;
    RESULT : out std_logic;
    S : out std_logic_vector(1 downto 0);
    ST : out std_logic_vector(1 downto 0)
  );
end control;

architecture Behavioral of control is
begin
  process (CLK)
    variable internal_state : std_logic_vector(2 downto 0) := "111";
  begin
    if rising_edge(CLK) then
      if (INIT = '1') then
        internal_state := "000";
        EN125 <= '0';
        EN346 <= '0';
        EN78 <= '0';
        RESULT <= '0';
      elsif internal_state /= "111" then
        if TRAFO_SIG = '0' then
          -- round module
          case internal_state is
            when "000" =>
              EN125 <= '1';
              ST <= "00";
              S <= "00";
            when "010" =>
              EN346 <= '1';
              ST <= "01";
              S <= "01";
            when "100" =>
              EN78 <= '1';
              ST <= "10";
              S <= "10";
            when "110" =>
              RESULT <= '1';
              ST <= "11";
              S <= "11";
            when others =>
              EN125 <= '0';
              EN346 <= '0';
              EN78 <= '0';
          end case;
        else
          -- output transformation
          case internal_state is
            when "000" =>
              EN125 <= '1';
              S <= "00";
              ST <= "01";
            when "010" =>
              EN346 <= '1';
              S <= "01";
              ST <= "00";
            when "011" =>
              EN346 <= '0';
              -- skip 100 and 101
              internal_state := "101";
            when "110" =>
              S <= "11";
              ST <= "10";
              RESULT <= '1';
            when others =>
              EN125 <= '0';
              EN346 <= '0';
              EN78 <= '0';
          end case;
        end if;
        -- count up
        internal_state := internal_state + '1';
      else
        RESULT <= '0';
      end if;
    end if;
  end process;

end Behavioral;