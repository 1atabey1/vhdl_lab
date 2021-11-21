def mulop(i1, i2, n):
    if i1 == 0:
        a = 2 ** n
    else:
        a = i1
    if i2 == 0:
        b = 2 ** n
    else:
        b = i2

    if (a * b) % (2 ** n) >= int((a * b) / (2 ** n)):
        ret = (a * b) % (2 ** n) - int((a * b) / (2 ** n))
    else:
        ret = (a * b) % (2 ** n) - int((a * b) / (2 ** n)) + 2 ** n + 1
    return ret & 0xFFFF


if __name__ == "__main__":
    test = mulop(1, 2, 16)
    print(test)
