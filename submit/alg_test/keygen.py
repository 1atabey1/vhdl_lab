def keygen(round_num, pkey_num):
    # round_num and pkey_num are 1-based
    PKEY_LEN = 16
    KEY_LEN = 128
    PKEYS_PER_ROUND = 6
    i = PKEYS_PER_ROUND * (round_num - 1) + pkey_num
    num_prev_bits = (i - 1) * PKEY_LEN
    start_bit = (KEY_LEN-1) - 25 * int(num_prev_bits / 2**7)
    bit_hi = start_bit - (num_prev_bits % 2**7)
    bit_lo = bit_hi - (PKEY_LEN-1)

    if bit_lo < 0:
        # wrap around to KEY_LEN-1
        bit_lo = (KEY_LEN-1) - abs(bit_lo)

    return bit_hi, bit_lo


print(keygen(3, 1))
print(keygen(4, 2))
