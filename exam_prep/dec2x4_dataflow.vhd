library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DEC2X4 is
  port (
    A, B, EN : in std_logic;
    D : out std_logic_vector(3 downto 0)
  );
end DEC2X4;

architecture Behavioral of DEC2X4 is
begin
  D(0) <= '0' when A = '0' and B = '0' and EN = '1'
else D(0) <= '1';
  D(1) <= '0' when A = '0' and B = '1' and EN = '1'
else D(1) <= '1';
  D(2) <= '0' when A = '1' and B = '0' and EN = '1'
else D(2) <= '1';
  D(3) <= '0' when A = '1' and B = '1' and EN = '1'
else D(3) <= '1';
end Behavioral;