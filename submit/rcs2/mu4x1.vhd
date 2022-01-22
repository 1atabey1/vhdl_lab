----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:29:34 12/21/2021 
-- Design Name: 
-- Module Name:    mux4x1 - Behavioral 
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

ENTITY mux4x1 IS
    PORT (
        S : IN STD_LOGIC_VECTOR(1 downto 0);
        D0 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        D1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        D2 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        D3 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        O : OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
END mux4x1;

ARCHITECTURE Behavioral OF mux4x1 IS
BEGIN
	O <= D0 when (S = "00") else D1 when (S = "01") else D2 when (S = "10") else D3 when (S = "11");
END Behavioral;