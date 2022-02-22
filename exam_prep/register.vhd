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
library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity REG is
  port (
    CLK : in std_logic;
    EN : in std_logic;
    D : in std_logic_vector(15 downto 0);
    Q : out std_logic_vector(15 downto 0)
  );
end REG;

architecture Behavioral of REG is
begin
  REG_PROC : process (CLK)
  begin
    if rising_edge(CLK) then
      if EN = '1' then
        Q <= D;
      end if;
    end if;
  end process;
end Behavioral;