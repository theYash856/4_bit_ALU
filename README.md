# 4-Bit ALU - Verilog Implementation

## 1. Overview
A 4-bit Arithmetic Logic Unit (ALU) designed in Verilog HDL using behavioral modeling. It implements a 16-operation instruction set including arithmetic, logical, shift, and comparison functions. Each operation is selected via a 4-bit opcode and verified through a structured testbench and waveform analysis in Xilinx Vivado.

Built as my first RTL design project, marking an important milestone in my VLSI and digital design learning journey.

## 2. Features
- Modular hierarchical design — `ALU_TOP` handles top-level control and multi-bit operations, `ALU_4_bit` instantiates the `ALU_1_bit` cells
- Operates on two 4-bit operands (`A` and `B`)
- Supports 16 operations selected via a 4-bit opcode
- Implements arithmetic, logical, shift, and comparison functions
- Generates Carry, Zero, Sign, and Overflow status flags
- Verified using a dedicated testbench and waveform analysis in Xilinx Vivado

## 3. Instruction Set Architecture (ISA)
Supports 16 operations via 4-bit opcode (Operation Code)
| Opcode | Operation | Description |
|:------------:|:---------------:|:-----------------:|
| 0000| AND | Bitwise AND of A and B|
| 0001| OR | Bitwsie OR of A and B|
| 0010| NOT| Bitwise NOT of A|
| 0011| NAND | Bitwise NAND of A and B|
|0100| XOR | Bitwise XOR of A and B|
|0101| NOR | Bitwsie NOR of A and B|
|0110| ADD| A + B|
|0111| SUB | A - B|
|1000| SLL | Shift Left Logical of A|
|1001| SRL| Shift Right Logical of A|
|1010| SRA| Shift Right Arithmetic of A|
|1011| SEQ| Set Equal to A and B|
|1100| SLT | Set Less Than from A and B|
|1101| SGT| Set Greater Than from A and B|
|1110| Increment | A + 1 |
|1111| Decrement | A - 1| 

## 4. Project Structure
```
4-bit-ALU/
├── src/
│   ├── ALU_1_bit.v
│   ├── ALU_4_bit.v
│   └── ALU_TOP.v
├── tb/
│   └── ALU_TOP_tb.v
├── docs/
│   ├── schematic.png
│   └── waveform.png
└── README.md
```

