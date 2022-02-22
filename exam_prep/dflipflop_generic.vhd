entity DFF is
  generic (Tpd, Tsu, Thld : time); -- Delay, Setup, Hold
  port (
    Clk, D : in bit;
    Q : out bit);
end DFF;
architecture ArchDFF of DFF is

begin
  Q <= D after Tpd when Clk = '1' and Clk'event;
  -- Clk2q
  ChkSetup : process -- check the setup time
  begin -- throw assert to the shell if violated
    wait until Clk = '1';
    -- rising Clk edge
    assert D'last_event >= Tsu report "setup violation";
  end process ChkSetup;
  ChkHold : process -- Check the hold time
  begin -- throw assert to the shell if violated
    wait until Clk'delayed(Thld) = '1';
    assert D'delayed'last_event >= Thld report "hld viol.";
  end process ChkHold;
end ArchDFF;