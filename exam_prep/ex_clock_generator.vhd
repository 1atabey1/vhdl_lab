-- example 1
signal CLK : bit := '0';
constant PulsWidth : time := 20 ns;

ClockGen1 : process (CLK)
begin
  if CLK = '0' then
    CLK <= '1' after PulsWidth,
      '0' after 2 * PulsWidth; -- waveform
  end if;
end process ClockGen1;

-- example 2
ClockGen2a : process
begin
  CLK <= '1' after PulsWidth,
    '0' after 2 * PulsWidth;
  wait until CLK = '0'; -- i.e. wait until
  -- CLK changes to '0'
end process ClockGen2a;
ClockGen2b : process
begin
  CLK <= '1' after PulsWidth,
    '0' after 2 * PulsWidth;
  wait for 2 * PulsWidth; -- i.e. wait for
  -- this time interval
end process ClockGen2b;

-- example 3
ClockGen3 : process
begin
  CLK <= '0';
  wait for PulsWidth;
  CLK <= '1';
  wait for PulsWidth;
end process ClockGen3;