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

architecture Algorithm of DEC2X4 is
begin
  DEK : process (A, B, EN)
  begin
    D <= "1111";
    if EN = '1' then
      if A = '0' then
        if B = '0' then
          D(0) <= '0';
        else D(1) <= '0';
        end if;
      else -- A='1'
        if B = '0' then
          D(2) <= '0';
        else D(3) <= '0';
        end if;
      end if;
    end if;
  end process DEK;
end Algorithm;

entity INV is
  port (
    A : in bit;
    Z : out bit);
end INV;

architecture BEHAV_INV of INV is
begin -- behavioral description
  Z <= not A after 12 ns;
end BEHAV_INV;

entity NAND3 is
  port (
    I1, I2, I3 : in bit;
    Z : out bit);
end NAND3;

architecture BEHAV_NAND3 of NAND3 is
begin -- behavioral description
  Z <= not(I1 and I2 and I3)
    after 8 ns;
end BEHAV_NAND3;

architecture STRUCT_DEC2X4 of DEC2X4 is
  component INV
    port (
      A : in bit;
      Z : out bit);
  end component;
  component NAND3
    port (
      A, B, C : in bit;
      Z : out bit);
  end component;
  signal Abar, Bbar : bit;
begin -- net list (concurrent!)
  -- component instantiations
  I0 : INV port map(A, Abar);
  I1 : INV port map(B, Bbar);
  G0 : NAND3 port map(Abar, Bbar, EN, D(0));
  G1 : NAND3 port map(Abar, B, EN, D(1));
  G2 : NAND3 port map(A, Bbar, EN, D(2));
  G3 : NAND3 port map(A, B, EN, D(3));
end STRUCT_DEC2X4;