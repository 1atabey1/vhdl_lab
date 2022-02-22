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

architecture BEHAV_MUX4 of mux4x1 is
begin
  MUX4_proc : process (D0, D1, D2, D3, S)
    variable TMP : std_logic_vector(15 downto 0); -- variable w/o timing behavior
  begin
    case S is
      when "00" => TMP := D0;
      when "01" => TMP := D1;
      when "10" => TMP := D2;
      when "11" => TMP := D3; -- variable assignment
    end case; -- all alternatives must be listed!
    O <= TMP after 5 ns; -- signal assignment ("after" not synthesizable!)
  end process MUX4_proc; -- with delay
end BEHAV_MUX4;