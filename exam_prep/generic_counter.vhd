entity genCntr is
  generic (N : positive := 8);
  port (
    CLOCK, RESET : in bit;
    COUNTER : out integer range 0 to 2 ** N - 1);
end genCntr;

architecture arch_genCntr of genCntr is
  signal intCntr : integer range 0 to 2 ** N - 1;
begin
  process
  begin
    wait until (CLOCK'event and CLOCK = '1');
    if RESET = '1' or intCntr = 2 ** N - 1 then
      intCntr <= 0;
    else
      intCntr <= intCntr + 1;
    end if;
  end process;
  COUNTER <= intCntr;
end arch_genCntr;