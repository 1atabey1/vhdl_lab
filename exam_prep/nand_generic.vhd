entity NANDg is -- generic NAND gate
    generic(WL:positive:=3; -- word length
    PD:time:=8 ns); -- propagation delay
    port(X: in bit_vector(WL-1 downto 0);
    Y: out bit);
end NANDg;

architecture NANDg_behavior of NANDg is
begin
    NANDg_proc: process(X)
    begin
        Y <= '0' after PD; -- default
        for K in X'range loop -- attribute of signal X
            -- K = WL-1, WL-2, WL-3, ..., 1, 0
            if X(K)='0' then Y <= '1' after PD;
            end if;
        end loop;
    end process NANDg_proc;
end NANDg_behavior;