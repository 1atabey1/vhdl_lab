architecture STRUCT of Adder is
    component FULLADD
    port(A,B,CIN: in bit; SUM,CARRY: out
    bit);
    end component;
    component HALFADD
    port(A,B: in bit; SUM,CARRY: out
    bit);
    end component;
    signal C: bit_vector(0 to 3);
begin -- net list (concurrent!)
    -- component instantiations
    GEN_ADD: for I in 0 to 3 generate
        LOWER_BIT: if I=0 generate
            U0: HALFADD port map
                (A(I),B(I),S(I),C(I));
        end generate LOWER_BIT;

        UPPER_BITS: if I>0 generate
            UX: FULLADD port map
                (A(I),B(I),C(I-1),S(I),C(I));
        end generate UPPER_BITS;
    end generate GEN_ADD;
    COUT <= C(3);
end STRUCT;