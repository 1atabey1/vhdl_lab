----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:     
-- Design Name: 
-- Module Name:    mulop - Behavioral 
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
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY mulop IS
    PORT (
        I_1 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
        I_2 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
        O_1 : OUT STD_LOGIC_VECTOR (15 DOWNTO 0));
END mulop;

ARCHITECTURE Behavioral OF mulop IS
    -- modulo multiply
    CONSTANT all_zeros : STD_LOGIC_VECTOR(I_1'RANGE) := (OTHERS => '0');
    CONSTANT two16 : STD_LOGIC_VECTOR(16 DOWNTO 0) := '1' & all_zeros;
BEGIN
    mult_proc : PROCESS (I_1, I_2)
        VARIABLE ab_mod_2n : STD_LOGIC_VECTOR(15 DOWNTO 0);
        VARIABLE ab_div_2n : STD_LOGIC_VECTOR(16 DOWNTO 0);
        VARIABLE ret : STD_LOGIC_VECTOR(16 DOWNTO 0);
        VARIABLE a : STD_LOGIC_VECTOR(16 DOWNTO 0);
        VARIABLE b : STD_LOGIC_VECTOR(16 DOWNTO 0);
        VARIABLE ab : STD_LOGIC_VECTOR(32 DOWNTO 0);
    BEGIN
        -- check for 0 inputs
        IF I_1 = all_zeros THEN
            a := two16;
        ELSE
            a := '0' & I_1;
        END IF;

        IF I_2 = all_zeros THEN
            b := two16;
        ELSE
            b := '0' & I_2;
        END IF;
        -- compute full width product
        ab := STD_LOGIC_VECTOR(unsigned(a) * unsigned(b));
        -- compute modulo 2n
        ab_mod_2n := ab(15 DOWNTO 0);
        ab_div_2n := ab(32 DOWNTO 16);

        IF (ab_mod_2n >= ab_div_2n) THEN
            ret := ab_mod_2n - ab_div_2n;
        ELSE
            ret := ab_mod_2n - ab_div_2n + two16 + 1;
        END IF;

        O_1 <= ret(15 DOWNTO 0);

    END PROCESS mult_proc;
END Behavioral;