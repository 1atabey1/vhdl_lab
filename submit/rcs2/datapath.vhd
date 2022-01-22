----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:21:30 01/19/2022 
-- Design Name: 
-- Module Name:    datapath - Behavioral 
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

entity datapath is
    Port ( CLK : in  STD_LOGIC;
           S : in  STD_LOGIC_VECTOR(1 downto 0);
           EN125 : in  STD_LOGIC;
           EN346 : in  STD_LOGIC;
           EN78 : in  STD_LOGIC;
           X1 : in  STD_LOGIC_VECTOR(15 downto 0);
           X2 : in  STD_LOGIC_VECTOR(15 downto 0);
           X3 : in  STD_LOGIC_VECTOR(15 downto 0);
           X4 : in  STD_LOGIC_VECTOR(15 downto 0);
           Z1 : in  STD_LOGIC_VECTOR(15 downto 0);
           Z2 : in  STD_LOGIC_VECTOR(15 downto 0);
           Z3 : in  STD_LOGIC_VECTOR(15 downto 0);
           Z4 : in  STD_LOGIC_VECTOR(15 downto 0);
           Z5 : in  STD_LOGIC_VECTOR(15 downto 0);
           Z6 : in  STD_LOGIC_VECTOR(15 downto 0);
           Y1 : out  STD_LOGIC_VECTOR(15 downto 0);
           Y2 : out  STD_LOGIC_VECTOR(15 downto 0);
           Y3 : out  STD_LOGIC_VECTOR(15 downto 0);
           Y4 : out  STD_LOGIC_VECTOR(15 downto 0));
end datapath;

architecture Structure of datapath is
    COMPONENT mux4x1
    PORT(
         S : IN  std_logic_vector(1 downto 0);
         D0 : IN  std_logic_vector(15 downto 0);
         D1 : IN  std_logic_vector(15 downto 0);
         D2 : IN  std_logic_vector(15 downto 0);
         D3 : IN  std_logic_vector(15 downto 0);
         O : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    COMPONENT REG
    PORT (
        CLK : IN STD_LOGIC;
        EN : IN STD_LOGIC;
        D : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        Q : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
    END COMPONENT;
    COMPONENT XOROP
    Port ( I_1 : in  STD_LOGIC_VECTOR (15 downto 0);
           I_2 : in  STD_LOGIC_VECTOR (15 downto 0);
           O_1 : out  STD_LOGIC_VECTOR (15 downto 0));
    END COMPONENT;
    COMPONENT ADDOP
    Port ( I_1 : in  STD_LOGIC_VECTOR(15 downto 0);
           I_2 : in  STD_LOGIC_VECTOR(15 downto 0);
           O_1 : out  STD_LOGIC_VECTOR(15 downto 0));
    END COMPONENT;
    COMPONENT MULOP
    port (
        I_1 : in std_logic_vector (15 downto 0);
        I_2 : in std_logic_vector (15 downto 0);
        O_1 : out std_logic_vector (15 downto 0));
    END COMPONENT;

    -- internal signals
    -- muxxers
    signal m1out : std_logic_vector(15 downto 0) := (others => '0');
    signal m2out : std_logic_vector(15 downto 0) := (others => '0');
    signal m3out : std_logic_vector(15 downto 0) := (others => '0');
    signal m4out : std_logic_vector(15 downto 0) := (others => '0');

    -- registers
    signal r1out : std_logic_vector(15 downto 0);
    signal r2out : std_logic_vector(15 downto 0);
    signal r3out : std_logic_vector(15 downto 0);
    signal r4out : std_logic_vector(15 downto 0);
    signal r5out : std_logic_vector(15 downto 0);
    signal r6out : std_logic_vector(15 downto 0);
    signal r7out : std_logic_vector(15 downto 0);
    signal r8out : std_logic_vector(15 downto 0);

    -- xor
    signal x1out : std_logic_vector(15 downto 0);
    signal x2out : std_logic_vector(15 downto 0);
    signal x3out : std_logic_vector(15 downto 0);
    signal x4out : std_logic_vector(15 downto 0);
    signal x5out : std_logic_vector(15 downto 0);

    -- add
    signal a1out : std_logic_vector(15 downto 0);

    -- mul
    signal mul1out : std_logic_vector(15 downto 0);
begin
    m1 : mux4x1
        port map (
            S => S,
            D0 => X1,
            D1 => X4,
            D2 => Z5,
            D3 => Z6,
            O => m1out
        );
    m2 : mux4x1
        port map (
            S => S,
            D0 => Z1,
            D1 => Z4,
            D2 => r5out,
            D3 => r8out,
            O => m2out
        );
    m3 : mux4x1
        port map (
            S => S,
            D0 => X3,
            D1 => X2,
            D2 => r6out,
            D3 => r7out,
            O => m3out
        );
    m4 : mux4x1
        port map (
            S => S,
            D0 => Z3,
            D1 => Z2,
            D2 => mul1out,
            D3 => mul1out,
            O => Y4
        );
    mult : MULOP
        port map (
            I_1 => m1out,
            I_2 => m2out,
            O_1 => mul1out);
    r1 : REG
        port map (
            CLK => CLK,
            EN => EN125,
            D => mul1out,
            Q => r1out);
    r2 : REG
        port map (
            CLK => CLK,
            EN => EN125,
            D => a1out,
            Q => r2out);
    r3 : REG
        port map (
            CLK => CLK,
            EN => EN346,
            D => a1out,
            Q => r3out);
    r4 : REG
        port map (
            CLK => CLK,
            EN => EN346,
            D => mul1out,
            Q => r4out);
    r5 : REG
        port map (
            CLK => CLK,
            EN => EN125,
            D => x1out,
            Q => r5out);
    r6 : REG
        port map (
            CLK => CLK,
            EN => EN346,
            D => x1out,
            Q => r6out);
    r7 : REG
        port map (
            CLK => CLK,
            EN => EN78,
            D => mul1out,
            Q => r7out);
    r8 : REG
        port map (
            CLK => CLK,
            EN => EN78,
            D => a1out,
            Q => r8out);
    adder : ADDOP
        port map (
            I_1 => m3out,
            I_2 => m4out,
            O_1 => a1out);
    xor1 : XOROP
        port map (
            I_1 => mul1out,
            I_2 => a1out,
            O_1 => x1out);
    xor2 : XOROP
        port map (
            I_1 => r3out,
            I_2 => a1out,
            O_1 => Y3);
    xor3 : XOROP
        port map (
            I_1 => r2out,
            I_2 => mul1out,
            O_1 => Y2);
    xor4 : XOROP
        port map (
            I_1 => r4out,
            I_2 => a1out,
            O_1 => Y4);
    xor5 : XOROP
        port map (
            I_1 => r1out,
            I_2 => mul1out,
            O_1 => Y1);
end Structure;

