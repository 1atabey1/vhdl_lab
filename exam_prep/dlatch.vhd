entity DLATCH is
  port (
    D, EN : in bit;
    Q : out bit := '0';
    Qq : out bit := '1');
end DLATCH;

architecture BEHAVIOR_DLATCH of DLATCH is
  constant Q_delay : time := 5 ns;
  constant Qq_delay : time := 8 ns;
begin
  DLATCH_proc : process (D, EN)
  begin
    if EN = '1'
      then
      Q <= D after Q_delay;
      Qq <= not D after Qq_delay;
    end if;
  end process DLATCH_proc;
end BEHAVIOR_DLATCH;