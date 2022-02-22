# VHDL Basics

## Formal Construction of Models

### entity 
-> describes the external view of a component
```
ENTITY DEMUX2X4 IS
    PORT (
        A, B, EN : IN STD_LOGIC;
        D : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END DEMUX2X4;
```

### architecture
- provide internal view of component, describe function of associated entity (=implementation of an entity)
- can be either *behavioral* (=describe function of a component) or *structural* (=composition of subcomponents)

### Behavioral Architectures
- Algorithmic: sequential description of function -> listed in a **single** process (conditional assignments can *not* be implemented here - e.g. `D <= '0' WHEN A ELSE '1'` would *not* compile)
- Dataflow: concurrent description of function (`case` or `wait for` statements will *not* work here)

## Libraries and Packages
- `WORK` is loaded by default, this includes all components that have been compiled in this project previously. Can be referenced without explicit import.
- `STANDARD` is also loaded by default, it includes basic datatypes
- `IEEE` is required for IEEE datatypes and operations

## Some relevant signal events
- `S'event`: `true` if event of signal `S` occured
- `S'last_event`: simulation time passed since last event
- `S'last_value`: last value before event occured
- `S'stable(T)`: `true` if no event occured since `T`
- `S'delayed(T)`: returns signal `S` but delayed by `T`
- Rising edge detection:
```
if (SIGNAL'event and SIGNAL='1') then ...
-- or (if IEEE std_logic_1164 included)
if (rising_edge(SIGNAL)) then ...
```
- Falling edge detection:
```
if (SIGNAL'event and SIGNAL='0') then ...
-- or (if IEEE std_logic_1164 included)
if (falling_edge(SIGNAL)) then ...
```

## Operators
- `&`: Concatenate
```
signal U,V,W : std_logic_vector(31 downto 0);
begin
W <= “00“ & V(14 downto 0) & U(14 downto 0);
```
- `+`, `*`, `-`, `/`: math operators (need to be defined for used datatype!)
```
use IEEE.STD_LOGIC_UNSIGNED.ALL;
signal U,V,W : std_logic_vector(15 downto 0);
begin
W <= V + U;
-- or (port/ signal must be defined as unsigned)
use IEEE.NUMERIC_STD.ALL;
signal U,V,W : unsigned(15 downto 0);
begin
W <= V + U;
```
- `sll`, `srl`: logical shift with fill value `'0'` (e.g. `"1100" srl 2` yields `"0011"`)
- `sla`, `sra`: arithmetic shift with fill value right- or left-hand bit (e.g. `"1100" sra 2`yields `"1111"`)
- `ror`, `rol`: rotate (e.g. `"1100" rol 1` yields `"1001"`)

## Wait Statements
- `wait on SIGNAL1, SIGNAL2;`: sensitivity clause -> resume execution when at least one of the signals changes value
- `wait until CLOCK='1';`: condition clause -> resume when condition true
- `wait for TIME;` or `wait for 1 ms;`: time-out clause -> resume after given time has passed
- `wait;` wait forever

### After Statement
Can only occur after signal assignment. Is *ignored* during synthesis. Example:
```
CLK <= '1' after PulsWidth, '0' after 2*PulsWidth;
``` 

## Process Statements
- Process without sensitivity list (with `wait` statements):
    - execute statements in sequence, restart at beginning when done
    - at least one `wait` necessary to avoid infinite loops
    - *not* synthesizable! - usually used in testbenches
- Process with sensitivity list (no `wait`):
    - process activated when at least one signal from sensitivity list changes its value
    - in simulation equivalent to process with *wait-on-signal* statement

## Circuit Simulation
Very time consuming due to large circuits, work around this with *Event-Driven Simulation*. Time intervals are defined by input events.

-> This requires a clear distinction between *simulation time* and *execution time*
- simulation time: the time the circuit is deemed to take during real operation. Starts at 0 at start of execution and is incremented in discrete steps (*discrete event simulation*)
- execution time: (real) passed time on host machine running simulation

### Transactions and Events
- Transaction: 
    - Generated when executing a signal assignment statement and scheduled for later. Consists of `(new_signal_value, simulation_time)`.
    - When inserting a new transaction `(V_n, T_n)` all transactions with `T_n <= T_i` are deleted. New transaction is appended at the end.
        - Considering *Inertial-Delay* (=effect of reactances in circuit): all transactions with `T_n <= T_i` are deleted, new one is appended at the end. Maintain uninterrupted list of transactions with `V_i ===V_n` -> delay **and** value will influence behaviour!
- Event: When at time of a transaction previous signal value differs from new one an *event* occurs

-> Processes react on *events* **not** on *transactions*!

### Signal driver
A chronologically ordered list of all scheduled transactions for a given signal (=list of *signal_value, simulation_time* pairs, i.e. `(V_i, T_i)`). First pair `(V_0, T_0)` is created at initialisation. Only one driver per signal is allowed -> if a signal is driven by more than one source a **resolution function** needs to be specified to define the resulting value.

### Simulation Cycles
#### Init Phase
All initial values are assigned to variables and signals. Simulation time is set to `0 fs`. All processes are activated and run until suspension (e.g. through a `wait` statement).
This phase only runs once per simulation, calls *Signal Update Phase* afterwards.

##### Signal Update Phase
- Advance the simulation time to the earliest time at which a transaction (or process timeout) is scheduled
- Execute all scheduled transactions for current time
- Transition to *Process Execution Phase*

##### Process Execution Phase
- Execute processes according to their sensitivity lists and the active events
- Possibly schedule new transactions
- Transition back to *Signal Update Phase*

### Delta Delays
= Optionally defined signal delay times defined by an `after` statement. If no delay is given, `0 fs` is assumed.

-> Delay of `0 fs` does **not** imply immediate assignment! It will always schedule a *transaction* that is earliest executed in the next cycle. This concept ensures **causality** of all statements during simulation.

Why is this necessary? -> Immediate signal assignments are impossible in the real world, there is alway at least the propagation delay that needs to be considered (also think of reactances that will influence dynamic behaviour). Ignoring this fact would e.g. render flip flops useless as they won't reach a stable state.

## Finite State Machines (FSM)
Here: Synchronous sequential circuit. Means, all functions are controlled by a clock (and only a clock!)

- **Moore FSM**: Output only function of the current state (=independent from input values)
- **Mealy FSM** Output is a function of current state *and* input

### FSM Properties
Usually consists of three functional blocks:
- State Memory
    - N sync flipped flip flops
    - 2^N states can be binary coded
    - Value of next state is updated on clock
    - Can block operation with an *enable* signal
    - Can init with *reset* signal
- Next State Logic: some combinational logic
- Output Logic: some combinational logic

## Common Synthesis Problems
### Wait Statements
No! User `after` if sth needs explicit delay for simulation. 

### Bad Synchronous Description
Bad Example:
```
process (clk, reset) is
begin
    if (reset = '1' ) then
        q <= '0';
    end if;
        if rising_edge(clk) then
            q <= d;
    end if;
end process;
```
-> Bad! Chain with `elsif ...` for asynchronous reset instead.

### Multiple Driver Problem
Bad Example:
```
architecture BEHAVIOR of control_unit is
begin
    proc_1: process(…)
    begin
        COM <= …
    end process proc_1;
    proc_2: process(…)
    begin
        COM <= …
    end process proc_2;
end BEHAVIOR;
```
-> Try to always only use one driver per signal! This would require definition of a *resolution function*.

### Clock Edge
Always try to stick with either *rising* or *falling* edge. Convention: use **rising clock edge** (Flip flops can often only handle one edge).

### Generated Latches
Synthesis creates a latch if a branch in a conditional statement is not considered. Always use `else` or `when others` with some defined default behaviour in `if` or `case` statements. Latches can be used intentionally if you e.g. wanna implement a flip flop.

### (Unintentional) Loops
- Sequential Circuit: Loop should be interrupted with e.g. flip flops
- Combinational Circuit: Loop is okay (e.g. ring oscillator = NANDs in series)
- Pay attention with Mealy FSMs (Loops intended by design - next state depends on output of previous state). Use flip flops or register to interrupt loops.

### Gated Clocks
=Combinational logic between clock source and sink. May be by accident or intentional to optimize skew or switch off certain circuits. Should be avoided due to possible timing issues.

### Variables vs. Signals
There is no such thing as *variables* in hardware. The base line is to always use signals and only resort to variables if their effect is clear (handling of variables may depend on synthesis tool)

### Uncomplete Sensitivity List

### After statement
The `after` statement is only considered in simulation, i.e. your implementation logic should never depend on it. The synthesiser will always ignore `after` statements

## Post-Place and Route Simulation
Can be used to debug not working hardware. Usually follows this sequence:
- Synthesis: create gate netlist from behavioural description
- Translation: merge gate netlist with additional constraints
- Mapping: Map gates to actual FPGA resources
- Place & Route: Generate timing models after connecting resources

Set `KEEP_HIERARCHY` attribute in architecture that you want to examine:
```
architecture Struct of idea is

attribute keep_hierarchy : string;
attribute keep_hierarchy of Struct: architecture
    is "yes";

begin ...
```