# Basic Computer Organization and Design: Common Bus system, instruction codes, instruction format, instruction set completeness, Sequence Counter, timing and control, instruction cycle,memory reference instructions and their implementation using arithmetic, logical, program control, transfer and input output micro-operations, interrupt cycle

# Basic Computer Organization and Design

# 1. Common Bus System: A simple implementation
class CommonBusSystem:
    def __init__(self):
        self.data_bus = 0
        self.address_bus = 0
        self.control_bus = {
            "read": 0,
            "write": 0,
            "reset": 0
        }

    def set_data(self, data):
        self.data_bus = data

    def set_address(self, address):
        self.address_bus = address

    def control_signal(self, read, write, reset):
        self.control_bus["read"] = read
        self.control_bus["write"] = write
        self.control_bus["reset"] = reset

    def __str__(self):
        return f"Data Bus: {self.data_bus}, Address Bus: {self.address_bus}, Control Bus: {self.control_bus}"


# 2. Instruction Codes and Instruction Format
class Instruction:
    def __init__(self, opcode, operand):
        self.opcode = opcode  # Operation code (e.g., ADD, MOV)
        self.operand = operand  # Operand (data or address)

    def __str__(self):
        return f"Opcode: {self.opcode}, Operand: {self.operand}"


# 3. CPU: Handles execution of instructions
class CPU:
    def __init__(self):
        self.accumulator = 0  # Accumulator (AC)
        self.program_counter = 0  # Program Counter (PC)
        self.instruction_register = None  # Instruction Register (IR)
        self.memory = [0] * 256  # Simulated memory with 256 locations
        self.bus = CommonBusSystem()

    def fetch(self):
        # Fetch the instruction from memory
        self.instruction_register = self.memory[self.program_counter]
        self.program_counter += 1

    def decode(self):
        # Decode instruction and identify operation (simple example)
        if self.instruction_register.opcode == "ADD":
            return "ADD operation"
        elif self.instruction_register.opcode == "MOV":
            return "MOV operation"
        else:
            return "Unknown operation"

    def execute(self):
        # Execute the operation
        if self.instruction_register.opcode == "ADD":
            self.accumulator += self.instruction_register.operand
        elif self.instruction_register.opcode == "MOV":
            self.accumulator = self.instruction_register.operand
        else:
            print("Unknown opcode")

    def run(self):
        # Simulate the instruction cycle
        self.fetch()
        print(f"Fetched Instruction: {self.instruction_register}")
        print(self.decode())
        self.execute()
        print(f"Accumulator after execution: {self.accumulator}")


# 4. Instruction Cycle and Micro-operations
def instruction_cycle(cpu):
    # Simulate one instruction cycle
    cpu.fetch()
    print(f"Instruction Fetch: {cpu.instruction_register}")
    cpu.decode()
    print(f"Instruction Decode: {cpu.decode()}")
    cpu.execute()
    print(f"Accumulator: {cpu.accumulator}")


# 5. Memory Reference Instructions
def memory_reference_instructions(cpu):
    # Example of a memory reference instruction (ADD)
    cpu.memory[0] = Instruction("ADD", 5)  # Store ADD instruction in memory
    cpu.memory[1] = Instruction("MOV", 10)  # Store MOV instruction in memory

    # Simulate the execution cycle
    print("\nExecuting ADD Instruction:")
    cpu.program_counter = 0
    instruction_cycle(cpu)

    print("\nExecuting MOV Instruction:")
    cpu.program_counter = 1
    instruction_cycle(cpu)


# 6. Program Control and Input/Output Micro-operations
def program_control(cpu):
    # Example of program control (branching)
    cpu.memory[0] = Instruction("MOV", 3)  # MOV 3 to accumulator
    cpu.memory[1] = Instruction("ADD", 5)  # ADD 5 to accumulator
    cpu.memory[2] = Instruction("MOV", 0)  # MOV 0 to accumulator

    # Simulate the execution with a simple branching (program counter manipulation)
    print("\nExecuting Program with Control:")
    cpu.program_counter = 0
    instruction_cycle(cpu)

    cpu.program_counter = 1
    instruction_cycle(cpu)

    cpu.program_counter = 2
    instruction_cycle(cpu)


# 7. Interrupt Cycle
def interrupt_cycle(cpu):
    # Simulate the interrupt cycle
    print("\nSimulating Interrupt Cycle:")
    print("Initial Accumulator:", cpu.accumulator)
    # Simulate an interrupt: let's assume an interrupt happens after the second instruction
    cpu.memory[3] = Instruction("ADD", 2)  # Simulate an interrupt that adds 2
    cpu.program_counter = 3
    instruction_cycle(cpu)


# Main function to execute the simulation
if __name__ == "__main__":
    cpu = CPU()

    # Simulate Memory Reference Instructions (ADD, MOV)
    memory_reference_instructions(cpu)

    # Simulate Program Control (branching)
    program_control(cpu)

    # Simulate Interrupt Cycle
    interrupt_cycle(cpu)
