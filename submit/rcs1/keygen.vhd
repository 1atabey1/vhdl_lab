----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:03:02 12/22/2021 
-- Design Name: 
-- Module Name:    keygen - Behavioral 
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
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY keygen IS
    PORT (
        KEYIN : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
        SEL : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        PKEY1 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
        PKEY2 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
        PKEY3 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
        PKEY4 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
        PKEY5 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
        PKEY6 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
END keygen;

ARCHITECTURE Behavioral OF keygen IS
    FUNCTION wrapped_subtract(
        minuend : unsigned(15 DOWNTO 0);
        subtrahend : unsigned(15 DOWNTO 0);
        wrap_at : unsigned(15 DOWNTO 0))
        RETURN unsigned IS
        VARIABLE RET : unsigned(15 DOWNTO 0);
    BEGIN
        IF minuend >= subtrahend THEN
            RET := minuend - subtrahend;
        ELSE
            RET := wrap_at - (subtrahend - minuend);
        END IF;
        RETURN RET;
    END FUNCTION;

    FUNCTION get_pkey(
        key : STD_LOGIC_VECTOR(127 DOWNTO 0);
        round_num : UNSIGNED(3 DOWNTO 0);
        pkey_num : UNSIGNED(3 DOWNTO 0))
        RETURN STD_LOGIC_VECTOR IS
        VARIABLE i, start_bit, num_prev_bits, bit_hi, bit_lo : unsigned(15 DOWNTO 0);
        CONSTANT KEY_LEN : UNSIGNED(7 DOWNTO 0) := x"80";
        CONSTANT PKEY_LEN : UNSIGNED(7 DOWNTO 0) := x"10";
        CONSTANT PKEYS_PER_ROUND : UNSIGNED(7 DOWNTO 0) := x"06";
        CONSTANT SHIFT_VAL : UNSIGNED(7 DOWNTO 0) := x"19";
    BEGIN
        i := PKEYS_PER_ROUND * (round_num - x"1") + pkey_num;
        num_prev_bits := (i - x"0001") * PKEY_LEN;
        start_bit := (KEY_LEN - x"0001") - SHIFT_VAL * (num_prev_bits(6 DOWNTO 0));
		  num_prev_bits := x"0000";
        bit_hi := wrapped_subtract(start_bit, num_prev_bits(6 DOWNTO 0), KEY_LEN - x"01");
        bit_lo := wrapped_subtract(bit_hi, PKEY_LEN - x"01", KEY_LEN - x"01");
        RETURN key(to_integer(bit_hi) DOWNTO to_integer(bit_lo));
    END FUNCTION;
    CONSTANT UNDEFINED16 : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => 'U');
BEGIN
    SEL_PROC : PROCESS (SEL, KEYIN)
    BEGIN
        CASE SEL IS
            WHEN x"0" =>
                PKEY1 <= get_pkey(KEYIN, x"1", x"1");
                PKEY2 <= get_pkey(KEYIN, x"1", x"2");
                PKEY3 <= get_pkey(KEYIN, x"1", x"3");
                PKEY4 <= get_pkey(KEYIN, x"1", x"4");
                PKEY5 <= get_pkey(KEYIN, x"1", x"5");
                PKEY6 <= get_pkey(KEYIN, x"1", x"6");
            -- WHEN x"1" =>
            --     PKEY1 <= get_pkey(KEYIN, x"2", x"1");
            --     PKEY2 <= get_pkey(KEYIN, x"2", x"2");
            --     PKEY3 <= get_pkey(KEYIN, x"2", x"3");
            --     PKEY4 <= get_pkey(KEYIN, x"2", x"4");
            --     PKEY5 <= get_pkey(KEYIN, x"2", x"5");
            --     PKEY6 <= get_pkey(KEYIN, x"2", x"6");
            -- WHEN x"2" =>
            --     PKEY1 <= get_pkey(KEYIN, x"3", x"1");
            --     PKEY2 <= get_pkey(KEYIN, x"3", x"2");
            --     PKEY3 <= get_pkey(KEYIN, x"3", x"3");
            --     PKEY4 <= get_pkey(KEYIN, x"3", x"4");
            --     PKEY5 <= get_pkey(KEYIN, x"3", x"5");
            --     PKEY6 <= get_pkey(KEYIN, x"3", x"6");
            -- WHEN x"3" =>
            --     PKEY1 <= get_pkey(KEYIN, x"4", x"1");
            --     PKEY2 <= get_pkey(KEYIN, x"4", x"2");
            --     PKEY3 <= get_pkey(KEYIN, x"4", x"3");
            --     PKEY4 <= get_pkey(KEYIN, x"4", x"4");
            --     PKEY5 <= get_pkey(KEYIN, x"4", x"5");
            --     PKEY6 <= get_pkey(KEYIN, x"4", x"6");
            -- WHEN x"4" =>
            --     PKEY1 <= get_pkey(KEYIN, x"5", x"1");
            --     PKEY2 <= get_pkey(KEYIN, x"5", x"2");
            --     PKEY3 <= get_pkey(KEYIN, x"5", x"3");
            --     PKEY4 <= get_pkey(KEYIN, x"5", x"4");
            --     PKEY5 <= get_pkey(KEYIN, x"5", x"5");
            --     PKEY6 <= get_pkey(KEYIN, x"5", x"6");
            -- WHEN x"5" =>
            --     PKEY1 <= get_pkey(KEYIN, x"6", x"1");
            --     PKEY2 <= get_pkey(KEYIN, x"6", x"2");
            --     PKEY3 <= get_pkey(KEYIN, x"6", x"3");
            --     PKEY4 <= get_pkey(KEYIN, x"6", x"4");
            --     PKEY5 <= get_pkey(KEYIN, x"6", x"5");
            --     PKEY6 <= get_pkey(KEYIN, x"6", x"6");
            -- WHEN x"6" =>
            --     PKEY1 <= get_pkey(KEYIN, x"7", x"1");
            --     PKEY2 <= get_pkey(KEYIN, x"7", x"2");
            --     PKEY3 <= get_pkey(KEYIN, x"7", x"3");
            --     PKEY4 <= get_pkey(KEYIN, x"7", x"4");
            --     PKEY5 <= get_pkey(KEYIN, x"7", x"5");
            --     PKEY6 <= get_pkey(KEYIN, x"7", x"6");
            -- WHEN x"7" =>
            --     PKEY1 <= get_pkey(KEYIN, x"8", x"1");
            --     PKEY2 <= get_pkey(KEYIN, x"8", x"2");
            --     PKEY3 <= get_pkey(KEYIN, x"8", x"3");
            --     PKEY4 <= get_pkey(KEYIN, x"8", x"4");
            --     PKEY5 <= get_pkey(KEYIN, x"8", x"5");
            --     PKEY6 <= get_pkey(KEYIN, x"8", x"6");
            WHEN OTHERS =>
                PKEY1 <= UNDEFINED16;
                PKEY2 <= UNDEFINED16;
                PKEY3 <= UNDEFINED16;
                PKEY4 <= UNDEFINED16;
                PKEY5 <= UNDEFINED16;
                PKEY6 <= UNDEFINED16;
        END CASE;
    END PROCESS;
END Behavioral;