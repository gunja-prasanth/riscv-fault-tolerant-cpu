# Instruction Decoder (Day-2)

## Overview
The Instruction Decoder is a key control block of the RISC-V CPU.  
This module interprets a 32-bit RISC-V instruction and converts it into meaningful control signals used by downstream CPU stages.

It analyzes specific instruction fields and determines the instruction category such as arithmetic, load, store, or branch.

---

## Functionality
The decoder performs the following operations:

- Extracts the **opcode** field from the instruction
- Analyzes **funct3** and **funct7** fields where required
- Identifies the instruction type
- Generates control signals:
  - `is_add`
  - `is_load`
  - `is_store`
  - `is_branch`

These control signals guide execution units and memory access logic in later pipeline stages.

---

## Verification & Validation
The module has been verified using:

- **Behavioral simulation** to validate correct decoding
- **RTL elaborated design** to confirm proper hardware structure and signal flow

---

## Simulation & Proof
All verification artifacts are provided inside the `sim_proof/` directory, including:

- Simulation waveform screenshots
- Open elaborated RTL design schematic

---

## Status
✅ RTL design completed  
✅ Simulation verified  
✅ Instruction decoding functioning correctly  

----
