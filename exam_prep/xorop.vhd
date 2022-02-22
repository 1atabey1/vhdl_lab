----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:26:37 11/13/2021 
-- Design Name: 
-- Module Name:    xorop - Behavioral 
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

entity xorop is
  port (
    I_1 : in std_logic_vector (15 downto 0);
    I_2 : in std_logic_vector (15 downto 0);
    O_1 : out std_logic_vector (15 downto 0));
end xorop;

architecture Behavioral of xorop is
begin
  XOR_proc : process (I_1, I_2)
  begin
    O_1 <= I_1 xor I_2;
  end process XOR_proc;
end Behavioral;