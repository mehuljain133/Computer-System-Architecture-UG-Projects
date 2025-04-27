# Memory Organization and Input-Output Organization: Input-Output Organization: PeripheralDevices, I/O interface, I/O vs. Memory Bus, Programmed I/O, Interrupt-Driven I/O, DirectMemory Access 

# Memory Organization and Input-Output Organization Simulation

# 1. Peripheral Devices
class PeripheralDevice:
    def __init__(self, device_type, data=""):
        self.device_type = device_type
        self.data = data
    
    def read(self):
        return f"Reading data from {self.device_type}: {self.data}"
    
    def write(self, data):
        self.data = data
        return f"Writing data to {self.device_type}: {self.data}"


# 2. I/O Interface
class IOInterface:
    def __init__(self):
        self.devices = {}  # A dictionary to hold peripheral devices

    def attach_device(self, device_id, device):
        self.devices[device_id] = device
        return f"Device {device.device_type} attached with ID {device_id}"

    def read_from_device(self, device_id):
        if device_id in self.devices:
            return self.devices[device_id].read()
        else:
            return "Device not found"
    
    def write_to_device(self, device_id, data):
        if device_id in self.devices:
            return self.devices[device_id].write(data)
        else:
            return "Device not found"


# 3. I/O Bus vs Memory Bus
class Bus:
    def __init__(self, bus_type):
        self.bus_type = bus_type  # Can be "I/O" or "Memory"
        self.data = None
    
    def transfer_data(self, data):
        self.data = data
        return f"Transferring {data} over {self.bus_type} bus"


# 4. Programmed I/O (Polling)
class ProgrammedIO:
    def __init__(self, io_interface):
        self.io_interface = io_interface
    
    def perform_io(self, device_id, data=None):
        if data:
            # Write data to the device
            return self.io_interface.write_to_device(device_id, data)
        else:
            # Read data from the device
            return self.io_interface.read_from_device(device_id)


# 5. Interrupt-Driven I/O
class InterruptDrivenIO:
    def __init__(self, io_interface):
        self.io_interface = io_interface
        self.interrupt_flag = False
    
    def interrupt_handler(self):
        if self.interrupt_flag:
            print("Interrupt received! Handling I/O operation.")
            # Perform I/O operation
            return self.io_interface.read_from_device(1)
        else:
            return "No interrupt"

    def trigger_interrupt(self):
        self.interrupt_flag = True
        return "Interrupt triggered"

    def clear_interrupt(self):
        self.interrupt_flag = False
        return "Interrupt cleared"


# 6. Direct Memory Access (DMA)
class DMA:
    def __init__(self, memory, io_interface):
        self.memory = memory  # Simulating memory as a list of data locations
        self.io_interface = io_interface
    
    def transfer_data(self, device_id, memory_location):
        data = self.io_interface.read_from_device(device_id)
        self.memory[memory_location] = data
        return f"Data transferred from {device_id} to memory location {memory_location}"


# 7. Memory Organization (Simple RAM)
class Memory:
    def __init__(self, size=1024):
        self.memory = [""] * size  # Simulated memory (list of empty strings)
    
    def read(self, location):
        return self.memory[location]
    
    def write(self, location, data):
        self.memory[location] = data
        return f"Writing {data} to memory location {location}"


# Main Simulation
def main():
    # Initialize memory and I/O interfaces
    memory = Memory(1024)
    io_interface = IOInterface()

    # Attach peripheral devices
    printer = PeripheralDevice("Printer", "Print job data")
    scanner = PeripheralDevice("Scanner", "Scanned image data")
    
    io_interface.attach_device(1, printer)
    io_interface.attach_device(2, scanner)

    # Simulate Programmed I/O (Polling)
    print("\n--- Programmed I/O (Polling) ---")
    programmed_io = ProgrammedIO(io_interface)
    print(programmed_io.perform_io(1))  # Read from printer
    print(programmed_io.perform_io(2))  # Read from scanner
    print(programmed_io.perform_io(1, "New print job data"))  # Write to printer

    # Simulate Interrupt-Driven I/O
    print("\n--- Interrupt-Driven I/O ---")
    interrupt_io = InterruptDrivenIO(io_interface)
    print(interrupt_io.trigger_interrupt())
    print(interrupt_io.interrupt_handler())  # Handle interrupt (read from device)
    print(interrupt_io.clear_interrupt())

    # Simulate Direct Memory Access (DMA)
    print("\n--- Direct Memory Access (DMA) ---")
    dma = DMA(memory, io_interface)
    print(dma.transfer_data(1, 100))  # Transfer data from device 1 (printer) to memory location 100
    print(f"Memory at location 100: {memory.read(100)}")

    # I/O Bus vs Memory Bus Simulation
    print("\n--- I/O vs Memory Bus ---")
    io_bus = Bus("I/O")
    memory_bus = Bus("Memory")
    
    print(io_bus.transfer_data("Printer data"))
    print(memory_bus.transfer_data("Memory content"))

if __name__ == "__main__":
    main()
