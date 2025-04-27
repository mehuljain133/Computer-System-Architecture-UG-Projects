# Central Processing Unit: Micro programmed Control vs Hardwired Control, lower levelprogramming languages, Instruction format, accumulator, general register organization, stackorganization, zero-address instructions, one-address instructions, two-address instructions, threeaddress instructions, Addressing Modes, RISC, CISC architectures, pipelining and parallelprocessing 

# Central Processing Unit (CPU) Simulation

# 1. Microprogrammed Control vs Hardwired Control
class ControlUnit:
    def __init__(self, control_type="hardwired"):
        self.control_type = control_type
    
    def get_control_signal(self, opcode):
        if self.control_type == "microprogrammed":
            return self.micro_programmed_control(opcode)
        else:
            return self.hardwired_control(opcode)
    
    def micro_programmed_control(self, opcode):
        # A simplified microprogrammed control
        control_signals = {
            "MOV": "Move data",
            "ADD": "Add operation",
            "SUB": "Subtract operation"
        }
        return control_signals.get(opcode, "Unknown opcode")
    
    def hardwired_control(self, opcode):
        # A simplified hardwired control logic
        if opcode == "MOV":
            return "Set MUX for MOV"
        elif opcode == "ADD":
            return "Activate ALU for ADD"
        elif opcode == "SUB":
            return "Activate ALU for SUB"
        else:
            return "Unknown opcode"


# 2. Instruction Formats
class Instruction:
    def __init__(self, opcode, operand1, operand2=None):
        self.opcode = opcode
        self.operand1 = operand1
        self.operand2 = operand2
    
    def __str__(self):
        if self.operand2 is None:
            return f"Opcode: {self.opcode}, Operand1: {self.operand1}"
        else:
            return f"Opcode: {self.opcode}, Operand1: {self.operand1}, Operand2: {self.operand2}"


# 3. CPU Structure with Accumulator, General Register, and Stack Organization
class CPU:
    def __init__(self):
        self.accumulator = 0
        self.registers = [0] * 4  # General-purpose registers (R0, R1, R2, R3)
        self.stack = []
        self.pc = 0  # Program Counter
    
    def fetch(self, memory, control_unit):
        instruction = memory[self.pc]
        self.pc += 1
        print(f"Fetched Instruction: {instruction}")
        control_signal = control_unit.get_control_signal(instruction.opcode)
        print(f"Control Signal: {control_signal}")
        self.execute(instruction)
    
    def execute(self, instruction):
        if instruction.opcode == "MOV":
            self.mov(instruction.operand1)
        elif instruction.opcode == "ADD":
            self.add(instruction.operand1)
        elif instruction.opcode == "SUB":
            self.sub(instruction.operand1)
        else:
            print("Unknown operation")
    
    def mov(self, value):
        self.accumulator = value
        print(f"Accumulator after MOV: {self.accumulator}")
    
    def add(self, value):
        self.accumulator += value
        print(f"Accumulator after ADD: {self.accumulator}")
    
    def sub(self, value):
        self.accumulator -= value
        print(f"Accumulator after SUB: {self.accumulator}")


# 4. Addressing Modes
class AddressingMode:
    def __init__(self, mode, address=None):
        self.mode = mode
        self.address = address
    
    def get_address(self, cpu):
        if self.mode == "immediate":
            return self.address
        elif self.mode == "direct":
            return cpu.registers[self.address]
        elif self.mode == "indirect":
            return cpu.registers[cpu.registers[self.address]]
        else:
            print("Unknown addressing mode")
            return None


# 5. RISC vs CISC Architectures
class Architecture:
    def __init__(self, architecture_type="RISC"):
        self.architecture_type = architecture_type
    
    def get_instruction_set(self):
        if self.architecture_type == "RISC":
            return ["MOV", "ADD", "SUB"]  # RISC has simple instructions
        elif self.architecture_type == "CISC":
            return ["MOV", "ADD", "SUB", "MUL", "DIV", "JMP"]  # CISC has complex instructions
        else:
            return []


# 6. Pipelining and Parallel Processing
class Pipeline:
    def __init__(self):
        self.stages = ["Fetch", "Decode", "Execute", "Memory", "Write-back"]
        self.pipeline_registers = [None] * len(self.stages)
    
    def process_instruction(self, instruction):
        print(f"Pipeline Stages for instruction: {instruction}")
        for stage in self.stages:
            self.pipeline_registers[self.stages.index(stage)] = stage
            print(f"Stage: {stage} - {instruction}")
    
    def show_pipeline(self):
        print("Current Pipeline State:")
        for i, stage in enumerate(self.stages):
            print(f"{stage}: {self.pipeline_registers[i]}")

# Main Simulation
def main():
    # Control Unit Initialization
    control_unit = ControlUnit(control_type="hardwired")
    
    # Creating Instructions
    instructions = [
        Instruction("MOV", 5),      # MOV operation
        Instruction("ADD", 10),     # ADD operation
        Instruction("SUB", 3)       # SUB operation
    ]
    
    # Memory with instructions
    memory = instructions

    # CPU Initialization
    cpu = CPU()
    
    # Simulation of Instruction Execution
    print("\n--- Fetching and Executing Instructions ---")
    for i in range(len(memory)):
        cpu.fetch(memory, control_unit)
    
    # Addressing Modes
    print("\n--- Testing Addressing Modes ---")
    addressing_mode = AddressingMode("immediate", 10)
    print(f"Immediate Addressing Mode: {addressing_mode.get_address(cpu)}")

    addressing_mode = AddressingMode("direct", 2)
    print(f"Direct Addressing Mode: {addressing_mode.get_address(cpu)}")

    # Architecture (RISC vs CISC)
    print("\n--- RISC vs CISC ---")
    risc_architecture = Architecture("RISC")
    print(f"RISC Instruction Set: {risc_architecture.get_instruction_set()}")
    
    cisc_architecture = Architecture("CISC")
    print(f"CISC Instruction Set: {cisc_architecture.get_instruction_set()}")
    
    # Pipelining
    print("\n--- Pipelining ---")
    pipeline = Pipeline()
    pipeline.process_instruction("MOV 5")
    pipeline.process_instruction("ADD 10")
    pipeline.show_pipeline()

if __name__ == "__main__":
    main()

