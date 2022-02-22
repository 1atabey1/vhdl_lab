entity FSM_Moore is
  port (
    Clock, Reset, Enable : in bit;
    E : in bit_vector(1 downto 0);
    A : out bit);
end FSM_Moore;

architecture sequence of FSM_Moore is
  type States is (Z0, Z1, Z2, Z3); -- enumeration type
  signal State, NSt : States;
begin
  -- State Memory
  StateMem : process (Clock, Reset) -- asynchronous reset
  begin
    if Reset = '1' then
      State <= Z0 after 20 ns;
    else
      if Clock = '1' and Clock'event then
        if Enable = '1' then -- synchronous enable
          State <= NSt after 20 ns;
        end if;
      end if;
    end if;
  end process StateMem;
  -- or (synchronous reset)
  StateMem : process (Clock) -- synchronous reset
  begin
    if Clock = '1' and Clock'event then
      if Reset = '1' then
        State <= Z0 after 20 ns;
      elsif Enable = '1' then -- synchronous enable
        State <= NSt after 20 ns;
      end if;
    end if;
  end process StateMem;

  -- Next State Logic
  NextStateLogic : process (E, State)
  begin
    case State is
      when Z0 => if E = "01" then
        NSt <= Z1 after 20 ns;
      else NSt <= Z0 after 20 ns;
    end if;
    when Z1 => if E = "11" then
    NSt <= Z2 after 20 ns;
  elsif E = "01" then
    NSt <= Z1 after 20 ns;
  else NSt <= Z0 after 20 ns;
  end if;
  when Z2 => if E = "10" then
  NSt <= Z3 after 20 ns;
elsif E = "01" then
  NSt <= Z1 after 20 ns;
else NSt <= Z0 after 20 ns;
end if;
when Z3 => if E = "01" then
NSt <= Z1 after 20 ns;
else NSt <= Z0 after 20 ns;
end if;
end case;
end process NextStateLogic;

-- Output Logic
OutputLogic : process (State)
begin
  case State is
    when Z3 => A <= '1' after 20 ns;
    when others => A <= '0' after 20 ns;
  end case;
end process OutputLogic;
end sequence;


-- Mealy Machine
entity FSM_Mealy is
  port (
    Clock, Reset, Enable : in bit;
    E : in bit_vector(1 downto 0);
    A : out bit);
end FSM_Mealy;


architecture sequence of FSM_Mealy is
  type States is (Z0, Z1, Z2); -- enumeration type
  signal State, NSt : States;
begin
  StateMem : process (Clock, Reset) -- asynchronous reset
  begin
    if Reset = '1' then
      State <= Z0 after 20 ns;
    else
      if Clock = '1' and Clock'event then
        if Enable = '1' then -- synchronous enable
          State <= NSt after 20 ns;
        end if;
      end if;
    end if;
  end process StateMem;
  -- or (synchronous reset)
  StateMem : process (Clock) -- synchronous reset
  begin
    if Clock = '1' and Clock'event then
      if Reset = '1' then
        State <= Z0 after 20 ns;
      elsif Enable = '1' then -- synchronous enable
        State <= NSt after 20 ns;
      end if;
    end if;
  end process StateMem;

  -- Next State Logic
  NextStateLogic : process (E, State)
  begin
    case State is
      when Z0 => if E = "01" then
        NSt <= Z1 after 20 ns;
      else NSt <= Z0 after 20 ns;
    end if;
    when Z1 => if E = "11" then
    NSt <= Z2 after 20 ns;
  elsif E = "01" then
    NSt <= Z1 after 20 ns;
  else NSt <= Z0 after 20 ns;
  end if;
  when Z2 => if E = "01" then
  NSt <= Z1 after 20 ns;
else NSt <= Z0 after 20 ns;
end if;
end case;
end process NextStateLogic;

-- Output Logic
OutputLogic : process (E, State)
begin
  if (State = Z2 and E = "10") then
    A <= '1' after 20 ns;
  else
    A <= '0' after 20 ns;
  end if;
end process OutputLogic;