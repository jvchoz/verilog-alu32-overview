# 32-bit ALU in Verilog

This project implements a 32-bit Arithmetic Logic Unit (ALU) in Verilog as part of the EECS 31L: Introduction to Digital Logic Laboratory course at the University of California, Irvine (Spring 2025).

The ALU supports both arithmetic and bitwise logical operations, controlled via a 4-bit `ALU_ctrl` input. It also detects special conditions such as overflow, carry-out, and whether the result is zero.

## Features

- **Inputs**:
  - `A_in` [31:0] – First 32-bit operand
  - `B_in` [31:0] – Second 32-bit operand
  - `ALU_ctrl` [3:0] – Operation selector

- **Outputs**:
  - `ALU_out` [31:0] – Operation result
  - `carry_out` – High on carry from MSB (for addition)
  - `zero` – High when result is all 0's
  - `overflow` – High on overflow in signed add/subtract

## Supported Operations

| ALU Control Code | Operation         |
|------------------|------------------|
| 4'b0000          | AND              |
| 4'b0001          | OR               |
| 4'b0010          | Add              |
| 4'b0110          | Subtract         |
| 4'b0111          | Set Less Than    |
| 4'b1100          | NOR              |
| 4'b1111          | Equal Comparison |

## Simulation & Testing

A testbench (`ALU_tb.v`) is included to verify the correctness of all operations. Each test case runs for 20ns and compares the output signals (`ALU_out`, `carry_out`, `zero`, `overflow`) against expected results.

## Files Included

- `ALU.v` — 32-bit ALU module
- `ALU_tb.v` — Testbench for simulating the ALU
- `EECS31L_LabReport2_ArithmeticLogicUnit.pdf` — Official lab report submitted for credit 

## Tools Used

- Vivado Design Suite
- ModelSim (for simulation)

## Author

James Ong
Electrical Engineering Undergraduate  
University of California, Irvine

## Academic Honesty Notice

This project was created for coursework in EECS 31L at UC Irvine.  
It is shared publicly for **educational and portfolio purposes only**.  
**Do not reuse or submit this code for academic credit.**

## License

This project is licensed under the [Creative Commons BY-NC-ND 4.0](https://creativecommons.org/licenses/by-nc-nd/4.0/) license.

> **You may view and share this work with attribution, but you may not reuse it for academic credit, modify it, or use it commercially.**
