# Create a Fetch routine of the instruction cycle. 

class CPU:
    def __init__(self):
        # Initialize registers: IR, DR, AC, AR, PC, I, E
        self.IR = 0x0000  # Instruction Register (16 bits)
        self.DR = 0x00  # Data Register (8 bits)
        self.AC = 0x00  # Accumulator (8 bits)
        self.AR = 0x000  # Address Register (12 bits)
        self.PC = 0x000  # Program Counter (12 bits)
        self.I = 0  # Indirect Addressing Bit (1 bit)
        self.E = 0  # Overflow/Condition Flag (1 bit)
        
        # Initialize memory (4096 words, each 8 bits)
        self.memory = [0] * 4096
    
    def load_memory(self, address, value):
        """Load value into memory at a given address"""
        if 0 <= address < len(self.memory):
            self.memory[address] = value
        else:
            raise ValueError("Address out of range")
    
    def fetch(self):
        """
        Fetches the next instruction from memory and stores it in the IR.
        It also increments the PC to point to the next instruction.
        """
        # Step 1: Copy the PC to the AR (Address Register)
        self.AR = self.PC
        
        # Step 2: Read memory at the address in AR (fetch the instruction)
        self.DR = self.memory[self.AR]
        
        # Step 3: Copy the instruction from DR to IR (Instruction Register)
        self.IR = self.DR
        
        # Step 4: Increment the PC (Program Counter) to point to the next instruction
        self.PC += 1
        
        print(f"Fetched instruction: {hex(self.IR)} at PC: {self.PC - 1}")
    
    def run(self):
        """Run the CPU to fetch and execute instructions in a loop"""
        while True:
            self.fetch()  # Fetch the next instruction
            if self.IR == 0xE001:  # Halt condition (HLT instruction)
                print("HALT: Program execution completed.")
                break


# Testing the Fetch routine

def main():
    cpu = CPU()

    # Load a simple program into memory (Fetch routine will load these instructions)
    # Example program:
    # LDA 0x000 (Load Accumulator from address 0)
    # ADD 0x001 (Add value at address 1)
    # HLT (Halt the program)

    cpu.load_memory(0, 0x4000)  # LDA 0x000
    cpu.load_memory(1, 0x2001)  # ADD 0x001
    cpu.load_memory(2, 0xE001)  # HLT (halt)

    cpu.load_memory(0x000, 10)  # Memory[0x000] = 10
    cpu.load_memory(0x001, 5)   # Memory[0x001] = 5

    print("Starting CPU execution...")
    cpu.run()


if __name__ == "__main__":
    main()
