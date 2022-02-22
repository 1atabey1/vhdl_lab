library IEEE;
use IEEE.std_logic_1164.all;

entity And2 is
  port (
    A, B : in std_logic;
    Y : out std_logic);
end And2;

architecture And2_with_delay of And2 is
  signal AndOut : std_logic;
begin
  And2_gate : process (A, B) -- idealized AND Gate
  begin
    AndOut <= A and B;
  end process And2_gate;
  And2_delay : process (AndOut)
  begin
    if AndOut = '1' then
      Y <= inertial '1' after 1.5 ns;
    elsif AndOut = '0' then
      Y <= inertial '0' after 1.2 ns;
    else
      Y <= inertial 'X' after 0.5 ns;
    end if;
  end process And2_delay;
end And2_with_delay;