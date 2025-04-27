# Digital Logic Circuits: Logic Gates, truth tables, Boolean Algebra, digital circuits,combinational circuits, sequential circuits, circuit simplification using Karnaugh map, Don’tCare Conditions, flip-flops, characteristic tables

import itertools

# Define basic logic gates
def AND(a, b):
    return a & b

def OR(a, b):
    return a | b

def NOT(a):
    return 1 - a

def NAND(a, b):
    return 1 - (a & b)

def NOR(a, b):
    return 1 - (a | b)

def XOR(a, b):
    return a ^ b

def XNOR(a, b):
    return 1 - (a ^ b)

# Function to generate truth table for any logic gate
def generate_truth_table(gate_function, num_vars):
    variables = list(itertools.product([0, 1], repeat=num_vars))
    truth_table = []
    for row in variables:
        result = gate_function(*row)
        truth_table.append((row, result))
    return truth_table

# Define a simple Boolean expression using AND, OR, and NOT (example: A AND B OR NOT C)
def boolean_expression(A, B, C):
    return OR(AND(A, B), NOT(C))

# Print truth table for a specific gate (e.g., AND gate for two variables)
def print_truth_table(gate_name, gate_function, num_vars):
    print(f"Truth Table for {gate_name}:")
    truth_table = generate_truth_table(gate_function, num_vars)
    for row, result in truth_table:
        print(f"Inputs: {row} -> Output: {result}")
    print("\n")

# Main function to demonstrate various gates and truth tables
def main():
    print_truth_table("AND Gate", AND, 2)
    print_truth_table("OR Gate", OR, 2)
    print_truth_table("NAND Gate", NAND, 2)
    print_truth_table("NOR Gate", NOR, 2)
    print_truth_table("XOR Gate", XOR, 2)
    print_truth_table("XNOR Gate", XNOR, 2)

    # Example of a custom Boolean expression
    print("Custom Boolean Expression (A AND B OR NOT C):")
    for A, B, C in itertools.product([0, 1], repeat=3):
        result = boolean_expression(A, B, C)
        print(f"A: {A}, B: {B}, C: {C} -> Result: {result}")

if __name__ == "__main__":
    main()
