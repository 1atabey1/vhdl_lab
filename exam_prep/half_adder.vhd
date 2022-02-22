entity HALF_ADDER is
  port (
    A, B : in bit;
    SUM, CARRY : out bit := '0');
end HALF_ADDER;

architecture CONCURRENT_HA of HALF_ADDER is
  constant S_delay : time := 8 ns;
  constant C_delay : time := 4 ns;
begin
  SUM <= A xor B after S_delay;
  CARRY <= A and B after C_delay;
end CONCURRENT_HA;