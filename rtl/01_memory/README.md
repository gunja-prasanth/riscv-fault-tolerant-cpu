# Instruction Memory (Day-1)

## Description
This module implements a ROM-based Instruction Memory for a RISC-V CPU.
Instructions are fetched using the Program Counter (PC).

## Files
- instruction_memory.v : RTL implementation
- sim_proof/ : Simulation waveform evidence

## Simulation Verification
The instruction memory was verified using a testbench.
Waveform proof is provided below.

### Verified Signals
- clk
- reset
- pc
- instruction

### Result
Instruction output correctly follows PC values.
ROM-based instruction fetch works as expected.

----
