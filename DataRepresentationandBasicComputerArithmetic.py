# Data Representation and Basic Computer Arithmetic: Number system, complements, fixed and floating point representation. Alphanumeric representation. Addition, subtraction

import struct

# 1. Number Systems Conversion
def binary_to_decimal(binary_str):
    return int(binary_str, 2)

def decimal_to_binary(decimal):
    return bin(decimal)[2:]

# 2. Complements
def twos_complement(binary_str):
    n = len(binary_str)
    inverted = ''.join('1' if bit == '0' else '0' for bit in binary_str)
    result = bin(int(inverted, 2) + 1)[2:].zfill(n)
    return result

# 3. Fixed and Floating Point Representation
def float_to_ieee754(value):
    return ''.join(f'{b:08b}' for b in struct.pack('!f', value))

# 4. Alphanumeric Representation
def char_to_ascii(character):
    return format(ord(character), '08b')

# 5. Basic Binary Arithmetic: Addition and Subtraction
def binary_add(a, b):
    max_len = max(len(a), len(b))
    a = a.zfill(max_len)
    b = b.zfill(max_len)
    
    result = ''
    carry = 0
    
    for i in range(max_len - 1, -1, -1):
        sum_ = int(a[i]) + int(b[i]) + carry
        if sum_ == 0:
            result = '0' + result
            carry = 0
        elif sum_ == 1:
            result = '1' + result
            carry = 0
        elif sum_ == 2:
            result = '0' + result
            carry = 1
        elif sum_ == 3:
            result = '1' + result
            carry = 1

    if carry != 0:
        result = '1' + result
        
    return result

def binary_subtract(a, b):
    b_complement = twos_complement(b)
    return binary_add(a, b_complement)

# Example usage
if __name__ == "__main__":
    # Number Systems
    print(binary_to_decimal("1010"))  # Output: 10
    print(decimal_to_binary(10))  # Output: 1010

    # Complements
    print(twos_complement("1011"))  # Output: 0101

    # Floating Point Representation
    print(float_to_ieee754(3.75))  # Output: IEEE 754 representation of 3.75

    # Alphanumeric Representation
    print(char_to_ascii("A"))  # Output: 01000001

    # Binary Arithmetic
    print(binary_add("1101", "1011"))  # Output: 11000
    print(binary_subtract("1101", "0011"))  # Output: 0010
