class CPU:
    def __init__(self):
        # Initialize registers: IR, DR, AC, AR, PC, I, E
        self.IR = 0x0000  # Instruction Register
        self.DR = 0x00  # Data Register
        self.AC = 0x00  # Accumulator
        self.AR = 0x000  # Address Register
        self.PC = 0x000  # Program Counter
        self.I = 0  # Indirect Addressing Bit
        self.E = 0  # Overflow/Condition Flag
        
        # Initialize memory (4096 words, each 8 bits)
        self.memory = [0] * 4096
    
    def load_memory(self, address, value):
        """Load value into memory at a given address"""
        if 0 <= address < len(self.memory):
            self.memory[address] = value
        else:
            raise ValueError("Address out of range")

    def fetch(self):
        """Fetch the instruction from memory at the current PC"""
        self.IR = self.memory[self.PC]
        self.PC += 1

    def execute(self):
        """Execute the current instruction based on its opcode"""
        opcode = (self.IR >> 12)  # Top 4 bits
        address = self.IR & 0x0FFF  # Lower 12 bits (Address part)

        # Depending on the opcode, perform different operations
        if opcode == 0x0:  # AND instruction
            self.AC &= self.memory[address]
        elif opcode == 0x2:  # ADD instruction
            self.AC += self.memory[address]
        elif opcode == 0x4:  # LDA instruction
            self.AC = self.memory[address]
        elif opcode == 0x6:  # STA instruction
            self.memory[address] = self.AC
        elif opcode == 0x8:  # BUN instruction
            self.PC = address
        elif opcode == 0xC:  # ISZ instruction
            self.memory[address] += 1
            if self.memory[address] == 0:
                self.PC += 1
        elif opcode == 0x1:  # AND_I (Indirect)
            self.IR = self.memory[address]
            self.AC &= self.memory[self.IR & 0x0FFF]  # Indirect addressing
        elif opcode == 0x3:  # ADD_I (Indirect)
            self.IR = self.memory[address]
            self.AC += self.memory[self.IR & 0x0FFF]  # Indirect addressing
        elif opcode == 0x5:  # LDA_I (Indirect)
            self.IR = self.memory[address]
            self.AC = self.memory[self.IR & 0x0FFF]  # Indirect addressing
        elif opcode == 0x7:  # STA_I (Indirect)
            self.IR = self.memory[address]
            self.memory[self.IR & 0x0FFF] = self.AC  # Indirect addressing
        elif opcode == 0x9:  # BUN_I (Indirect)
            self.IR = self.memory[address]
            self.PC = self.IR & 0x0FFF  # Indirect addressing
        elif opcode == 0xE:  # HLT instruction
            print("HALT: Program execution completed.")
            return False  # End execution
        else:
            print(f"Unknown opcode {opcode}")
        return True

    def run(self):
        """Run the CPU to fetch and execute instructions in a loop"""
        while True:
            self.fetch()  # Fetch the next instruction
            print(f"Executing instruction: {hex(self.IR)} at PC: {self.PC}")
            if not self.execute():  # Execute the instruction and check for HALT
                break


# Testing the CPU with a small program

def main():
    cpu = CPU()

    # Load a small program into memory
    # Example program:
    # LDA 0x000, ADD 0x001, STA 0x002, HLT

    cpu.load_memory(0, 0x4000)  # LDA 0x000
    cpu.load_memory(1, 0x2001)  # ADD 0x001
    cpu.load_memory(2, 0x6002)  # STA 0x002
    cpu.load_memory(3, 0xE001)  # HLT (halt)

    # Initialize some values in memory for the instructions to work with
    cpu.load_memory(0x000, 10)  # Memory[0x000] = 10
    cpu.load_memory(0x001, 5)   # Memory[0x001] = 5

    print("Starting CPU execution...")
    cpu.run()


if __name__ == "__main__":
    main()
