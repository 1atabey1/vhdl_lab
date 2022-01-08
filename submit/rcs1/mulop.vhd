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
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mulop is
  port (
    I_1 : in std_logic_vector (15 downto 0);
    I_2 : in std_logic_vector (15 downto 0);
    O_1 : out std_logic_vector (15 downto 0));
end mulop;

architecture Behavioral of mulop is
  -- modulo multiply
  constant all_zeros : std_logic_vector(I_1'range) := (others => '0');
  constant two16 : std_logic_vector(16 downto 0) := '1' & all_zeros;
  signal ab_mod_2n : std_logic_vector(15 downto 0);
  signal ab_div_2n : std_logic_vector(16 downto 0);
  signal a : std_logic_vector(16 downto 0);
  signal b : std_logic_vector(16 downto 0);
begin
  mult_proc : process (I_1, I_2, b, a, ab_div_2n, ab_mod_2n)
  variable ab : std_logic_vector(33 downto 0);
  variable ret : std_logic_vector(16 downto 0);
  begin
    -- check for 0 inputs
    if I_1 = all_zeros then
      a <= two16;
    else
      a <= '0' & I_1;
    end if;

    if I_2 = all_zeros then
      b <= two16;
    else
      b <= '0' & I_2;
    end if;
    -- compute full width product
    ab := std_logic_vector(unsigned(a) * unsigned(b));
    -- compute modulo 2n
    ab_mod_2n <= ab(15 downto 0);
    ab_div_2n <= ab(32 downto 16);

    if (ab_mod_2n >= ab_div_2n) then
      ret := ab_mod_2n - ab_div_2n;
    else
      ret := ab_mod_2n - ab_div_2n + two16 + 1;
    end if;

    O_1 <= ret(15 downto 0);

  end process mult_proc;
end Behavioral;