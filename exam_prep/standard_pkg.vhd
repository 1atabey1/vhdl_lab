package STANDARD is -- will be loaded by default
                    -- contains data type definitions
    type boolean is (false,true);
    type bit is ('0','1');
    type character is (...);
    type integer is ...;
    subtype natural is integer
    range 0 to integer'high;
    subtype positive is integer
    range 1 to integer'high;
    type real is ...;
    type time is ... units fs; ps=1000 fs; ...;
    type string is
    array (positive range <>) of character;
    type bit_vector is
        array (natural range <>) of bit;
    -- The associated operators are also defined.
end standard;