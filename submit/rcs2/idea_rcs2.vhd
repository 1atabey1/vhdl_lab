----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:     
-- Design Name: 
-- Module Name:    idea_rcs2 - Structural 
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
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity idea_rcs2 is
    Port ( CLOCK : in  STD_LOGIC;
           START : in  STD_LOGIC;
           KEY : in  STD_LOGIC_VECTOR (127 downto 0);
           X_1 : in  STD_LOGIC_VECTOR (15 downto 0);
           X_2 : in  STD_LOGIC_VECTOR (15 downto 0);
           X_3 : in  STD_LOGIC_VECTOR (15 downto 0);
           X_4 : in  STD_LOGIC_VECTOR (15 downto 0);
           Y_1 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y_2 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y_3 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y_4 : out  STD_LOGIC_VECTOR (15 downto 0);
           READY : out  STD_LOGIC);
end idea_rcs2;

architecture Structural of idea_rcs2 is
component mux2x1 is
	PORT (
        S : IN STD_LOGIC;
        D0 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        D1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        O : OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
end component;
component REG is
	PORT (
        CLK : IN STD_LOGIC;
        EN : IN STD_LOGIC;
        D : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        Q : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
end component;
component roundcounter is
	Port ( CLK : in  STD_LOGIC;
           START : in  STD_LOGIC;
           RESULT : in  STD_LOGIC;
           READY : out  STD_LOGIC;
           S_i : out  STD_LOGIC;
           INIT : out  STD_LOGIC;
           TRAFO : out  STD_LOGIC;
           ROUND : out  STD_LOGIC_VECTOR (3 downto 0));
end component;
component clockedround is
	port (
    CLK : in std_logic;
    INIT : in std_logic;
    TRAFO_SIG : in std_logic;
    X1 : in std_logic_vector (15 downto 0);
    X2 : in std_logic_vector (15 downto 0);
    X3 : in std_logic_vector (15 downto 0);
    X4 : in std_logic_vector (15 downto 0);
    Z1 : in std_logic_vector (15 downto 0);
    Z2 : in std_logic_vector (15 downto 0);
    Z3 : in std_logic_vector (15 downto 0);
    Z4 : in std_logic_vector (15 downto 0);
    Z5 : in std_logic_vector (15 downto 0);
    Z6 : in std_logic_vector (15 downto 0);
    Y1 : out std_logic_vector (15 downto 0);
    Y2 : out std_logic_vector (15 downto 0);
    Y3 : out std_logic_vector (15 downto 0);
    Y4 : out std_logic_vector (15 downto 0);
    RESULT : out std_logic;
    Y1_TRAFO : out std_logic_vector (15 downto 0);
    Y2_TRAFO : out std_logic_vector (15 downto 0);
    Y3_TRAFO : out std_logic_vector (15 downto 0);
    Y4_TRAFO : out std_logic_vector (15 downto 0));
end component;
component keygen is
	port (
    KEYIN : in std_logic_vector(127 downto 0);
    SEL : in std_logic_vector(3 downto 0);
    PKEY1 : out std_logic_vector(15 downto 0);
    PKEY2 : out std_logic_vector(15 downto 0);
    PKEY3 : out std_logic_vector(15 downto 0);
    PKEY4 : out std_logic_vector(15 downto 0);
    PKEY5 : out std_logic_vector(15 downto 0);
    PKEY6 : out std_logic_vector(15 downto 0));
end component;
    signal m1out : std_logic_vector(15 downto 0);
    signal m2out : std_logic_vector(15 downto 0);
    signal m3out : std_logic_vector(15 downto 0);
    signal m4out : std_logic_vector(15 downto 0);
    signal r1out : std_logic_vector(15 downto 0);
    signal r2out : std_logic_vector(15 downto 0);
    signal r3out : std_logic_vector(15 downto 0);
    signal r4out : std_logic_vector(15 downto 0);
    signal Z1 : std_logic_vector(15 downto 0);
    signal Z2 : std_logic_vector(15 downto 0);
    signal Z3 : std_logic_vector(15 downto 0);
    signal Z4 : std_logic_vector(15 downto 0);
    signal Z5 : std_logic_vector(15 downto 0);
    signal Z6 : std_logic_vector(15 downto 0);
    signal y1_temp : std_logic_vector(15 downto 0);
    signal y2_temp : std_logic_vector(15 downto 0);
    signal y3_temp : std_logic_vector(15 downto 0);
    signal y4_temp : std_logic_vector(15 downto 0);
    signal RESULT : std_logic;
    signal INIT : std_logic;
    signal TRAFO : std_logic;
    signal ROUND : std_logic_vector(3 downto 0);
    signal S : std_logic;
begin

rdcounter : roundcounter
port map(
    CLK => CLOCK,
    START => START,
    RESULT => RESULT,
    READY => READY,
    S_i => S,
    INIT => INIT,
    TRAFO => TRAFO,
    ROUND => ROUND);

extended_round : clockedround  
port map(
	CLK => CLOCK,
	INIT => INIT,
	TRAFO_SIG => TRAFO,
	X1 => m1out,
    X2 => m2out,
    X3 => m3out,
    X4 => m4out,
    Z1 => Z1,
    Z2 => Z2,
    Z3 => Z3,
    Z4 => Z4,
    Z5 => Z5,
    Z6 => Z6,
    Y1 => y1_temp,
    Y2 => y2_temp,
    Y3 => y3_temp,
    Y4 => y4_temp,
    RESULT => RESULT,
    Y1_TRAFO => Y_1,
    Y2_TRAFO => Y_2,
    Y3_TRAFO => Y_3,
    Y4_TRAFO => Y_4);

keygenerator : keygen 
port map(
    KEYIN => KEY,
    SEL => ROUND,
    PKEY1 => Z1,
    PKEY2 => Z2,
    PKEY3 => Z3,
    PKEY4 => Z4,
    PKEY5 => Z5,
    PKEY6 => Z6);

m1 : mux2x1
port map(
    S => S,
    D0 => r1out,
    D1 => X_1,
    O => m1out);

m2 : mux2x1
port map(
    S => S,
    D0 => r2out,
    D1 => X_2,
    O => m2out);

m3 : mux2x1
port map(
    S => S,
    D0 => r3out,
    D1 => X_3,
    O => m3out);

m4 : mux2x1
port map(
    S => S,
    D0 => r4out,
    D1 => X_4,
    O => m4out);

r1 : REG
port map(
    CLK => CLOCK,
    EN => RESULT,
    D => y1_temp,
    Q => r1out);

r2 : REG
port map(
    CLK => CLOCK,
    EN => RESULT,
    D => y2_temp,
    Q => r2out);

r3 : REG
port map(
    CLK => CLOCK,
    EN => RESULT,
    D => y3_temp,
    Q => r3out);

r4 : REG
port map(
    CLK => CLOCK,
    EN => RESULT,
    D => y4_temp,
    Q => r4out);
end Structural;

