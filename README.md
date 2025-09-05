# 4-Bit Gray Code Counter for FPGA

This repository contains the VHDL source code for a 4-bit Gray code counter designed to be implemented on an FPGA. The counter's output is displayed on a 4-digit 7-segment display.

## Project Overview

This project was developed for the Digital Systems and Computer Architecture Laboratory Course at Guilan University. It demonstrates a basic digital system design, including a sequential logic circuit (counter), clock management, and input/output handling.

## Functionality

The core of the project is a 4-bit counter that cycles through the Gray code sequence. Gray code is a binary numeral system where two successive values differ in only one bit.

The counter has the following features:
- **4-bit Gray Code Sequence**: The counter cycles through all 16 Gray code values from "0000" to "1000".
- **7-Segment Display Output**: The current 4-bit value of the counter is shown on a 4-digit 7-segment display. Each digit of the display shows one bit of the counter's value (either '0' or '1').
- **Push Button Control**: A push button is used to start and stop the counter. When the button is pressed, the counter advances through the sequence. When it is not pressed, the counter is paused.

## Hardware Setup

To run this project, you will need the following hardware:
- An FPGA development board
- A 4-digit, common anode 7-segment display
- A push button
- Connecting wires

The specific pin connections for the FPGA are defined in the `GrayCounter/pins.ucf` file. You may need to modify this file to match your specific FPGA board.

## Files

- **`GrayCounter/gray_counter.vhd`**: The main VHDL source file containing the design for the Gray code counter.
- **`GrayCounter/pins.ucf`**: The User Constraints File (UCF) that maps the design's ports to the physical pins of the FPGA.
- **`README.md`**: This file.

## Usage

1. **Synthesize and Implement**: Use an FPGA development tool (such as Xilinx ISE or Vivado) to synthesize the VHDL code and implement the design for your target FPGA.
2. **Connect Hardware**: Connect the 7-segment display and push button to the appropriate pins on your FPGA board, as defined in `GrayCounter/pins.ucf`.
3. **Program FPGA**: Upload the generated bitstream file to your FPGA.
4. **Operate**: Press the push button to cycle through the Gray code sequence. The 4-bit output will be displayed on the 7-segment display.
