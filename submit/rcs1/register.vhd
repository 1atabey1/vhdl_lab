----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:00:19 12/21/2021 
-- Design Name: 
-- Module Name:    register - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY REG IS
    PORT (
        CLK : IN STD_LOGIC;
        EN : IN STD_LOGIC;
        D : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        Q : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
END REG;

ARCHITECTURE Behavioral OF REG IS
BEGIN
    REG_PROC: PROCESS (CLK)
    BEGIN
        IF rising_edge(CLK) THEN
            IF EN = '1' THEN
                Q <= D;
            END IF;
        END IF;
    END PROCESS;
END Behavioral;