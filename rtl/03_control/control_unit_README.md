
# Control Unit (Day-3)

## Overview
This module implements the **base control unit** for a RISC-V processor.
It generates correct control signals purely based on instruction decoding,
without any fault-tolerance or safety logic.

## Generated Control Signals
- reg_write
- mem_read
- mem_write
- alu_op

## Design Characteristics
- Fully combinational logic
- Single always block
- No fault detection or recovery logic (baseline design)

## Verification
The control unit is verified using:
- Behavioral simulation
- RTL elaborated schematic

## Proof
Verification artifacts are available in:


## Status
✅ RTL implemented  
✅ Control signals verified  
✅ Ready for fault-tolerant extensions
