architecture STRUCTgen of DEC2X4 is
  component NANDg
    generic (
      WL : positive;
      PD : time);
    port (
      X : in bit_vector(WL - 1 downto 0);
      Y : out bit);
  end component;
  signal AQ, BQ : bit;
begin
  IA : NANDg generic map(1, 6 ns) port map(X(0) => A, Y => AQ);
  IB : NANDg generic map(1, 6 ns) port map(X(0) => B, Y => BQ);
  G0 : NANDg port map(
    X(2) => AQ, X(1) => BQ, X(0) => EN,
    Y => D(0));
  G1 : NANDg port map(
    X(2) => AQ, X(1) => B, X(0) => EN,
    Y => D(1));
  G2 : NANDg port map(
    X(2) => A, X(1) => BQ, X(0) => EN,
    Y => D(2));
  G3 : NANDg port map(
    X(2) => A, X(1) => B, X(0) => EN,
    Y => D(3));
end STRUCTgen;