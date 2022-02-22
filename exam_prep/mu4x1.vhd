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
library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux4x1 is
  port (
    S : in std_logic_vector(1 downto 0);
    D0 : in std_logic_vector(15 downto 0);
    D1 : in std_logic_vector(15 downto 0);
    D2 : in std_logic_vector(15 downto 0);
    D3 : in std_logic_vector(15 downto 0);
    O : out std_logic_vector(15 downto 0));
end mux4x1;

architecture Behavioral of mux4x1 is
begin
  O <= D0 when (S = "00") else D1 when (S = "01") else D2 when (S = "10") else D3 when (S = "11");
  -- with SEL select -- selector signal
  --     O <= D0 after 5 ns when "00";
  --         D1 after 5 ns when "01";
  --         D2 after 5 ns when "10";
  --         D3 after 5 ns when "11";
end Behavioral;