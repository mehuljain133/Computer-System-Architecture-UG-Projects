# Digital Components: Half Adder, Full Adder, Decoders, Multiplexers, Registers and MemoryUnits

import itertools

# Define basic logic gates
def AND(a, b):
    return a & b

def OR(a, b):
    return a | b

def NOT(a):
    return 1 - a

def XOR(a, b):
    return a ^ b

def XNOR(a, b):
    return 1 - (a ^ b)

# Half Adder
def half_adder(A, B):
    Sum = XOR(A, B)
    Carry = AND(A, B)
    return Sum, Carry

# Full Adder
def full_adder(A, B, Carry_in):
    Sum = XOR(XOR(A, B), Carry_in)
    Carry_out = OR(AND(A, B), AND(Carry_in, XOR(A, B)))
    return Sum, Carry_out

# Decoder (2-to-4)
def decoder_2_to_4(A, B):
    outputs = [NOT(A) and NOT(B), NOT(A) and B, A and NOT(B), A and B]
    return outputs

# Multiplexer (2-to-1)
def mux_2_to_1(S, I0, I1):
    return I0 if S == 0 else I1

# Register (4-bit)
class Register:
    def __init__(self, size=4):
        self.size = size
        self.value = [0] * size  # Initialize with 0

    def load(self, data):
        if len(data) == self.size:
            self.value = data
        else:
            raise ValueError(f"Data must be {self.size} bits long.")

    def read(self):
        return self.value

# Memory Unit (4x4)
class MemoryUnit:
    def __init__(self, size=4, word_size=4):
        self.size = size
        self.memory = [[0] * word_size for _ in range(size)]

    def write(self, address, data):
        if len(data) == len(self.memory[0]) and 0 <= address < self.size:
            self.memory[address] = data
        else:
            raise ValueError("Invalid address or data size")

    def read(self, address):
        if 0 <= address < self.size:
            return self.memory[address]
        else:
            raise ValueError("Invalid address")

# Example usage
if __name__ == "__main__":
    # Example of Half Adder
    print("Half Adder:")
    print(half_adder(1, 1))

    # Example of Full Adder
    print("\nFull Adder:")
    print(full_adder(1, 1, 1))

    # Example of Decoder (2-to-4)
    print("\nDecoder (2-to-4):")
    print(decoder_2_to_4(1, 0))

    # Example of Multiplexer (2-to-1)
    print("\nMultiplexer (2-to-1):")
    print(mux_2_to_1(1, 0, 1))

    # Example of Register
    reg = Register()
    reg.load([1, 0, 1, 0])
    print("\nRegister Value:")
    print(reg.read())

    # Example of Memory Unit
    memory = MemoryUnit()
    memory.write(0, [1, 1, 0, 1])
    print("\nMemory Unit Value at Address 0:")
    print(memory.read(0))
