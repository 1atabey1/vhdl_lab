-- example 1
entity MUX2 is
  port (
    A, B, SEL : in bit;
    Z : out bit);
end MUX2;

architecture behavior_1 of MUX2 is
  constant prop_delay : time := 2 ns;
begin
  MUX2_V1 : process (A, B, SEL)
  begin -- value changes of A, B, or SEL can
    -- result in value changes at output Z!
    case SEL is
      when '0' => Z <= A after prop_delay;
      when '1' => Z <= B after prop_delay;
    end case;
  end process MUX2_V1;
end behavior_1;

-- example 2
architecture behavior_2 of MUX2 is
  constant prop_delay : time := 2 ns;
begin
  MUX2_V2 : process
  begin
    case SEL is
      when '0' =>
        Z <= A after prop_delay;
        wait on SEL, A;
        -- The process does not wait for B,
        -- if A is selected!
      when '1' =>
        Z <= B after prop_delay;
        wait on SEL, B;
    end case;
  end process MUX2_V2;
end behavior_2;