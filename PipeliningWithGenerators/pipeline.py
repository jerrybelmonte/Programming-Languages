# Pipelining with generators.

import sys


def generate():
    for k in range(10):
        print('G', end='')
        yield k


def square(seq):
    for k in seq:
        print('Q', end='')
        yield k * k


def summ(seq):
    s = 0
    for k in seq:
        print('S', end='')
        s += k
    return s


def main():
    print(summ(square(generate())))
    return 0


"""
The logging will not output GGGGGGGGGGQQQQQQQQQQSSSSSSSSSS285
but rather GQSGQSGQSGQSGQSGQSGQSGQSGQSGQS285
indicating that the coroutines 'generate' and 'square' are executed
interleavingly with the function 'summ' that invokes them. 
"""
if __name__ == "__main__":
    sys.exit(main());
