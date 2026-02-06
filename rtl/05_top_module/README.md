# Day-5: Top_control_subsystem Module – Base Control Subsystem Integrated

## Objective
Integrate the **base control subsystem** of a simple RISC-V processor.  
Today's goal: connect all modules for **end-to-end instruction fetch → decode → control**.  
⚠️ **Note:** Fault detection logic is not included today.

---

## Modules Implemented

| Module Name             | Functionality                                               |
|-------------------------|------------------------------------------------------------|
| `instruction_memory.v`  | Holds instructions; outputs instruction based on PC.       |
| `decoder.v`             | Breaks instruction into opcode, funct fields, and registers.|
| `control_unit.v`        | Generates control signals (`alu_add`, `alu_sub`, `valid_instr`) based on opcode/funct7. |
| `pc_control.v`          | Updates the program counter (PC) every clock cycle.       |
| `top_control_subsystem.v` | Connects all above modules into one top-level module.     |

---

## Testbench

- **File:** `tb_top_control_subsystem.v`
- **Features:**
  - Clock generation
  - Reset handling
  - Displays all important signals on the console:
    - `PC`, `Instruction`, `Opcode`, `Funct7`, `ALU_ADD`, `ALU_SUB`, `VALID_INSTR`
  - Provides easy verification of **end-to-end fetch → decode → control**

---

## Simulation Example Output (Proof)

This **proves that the top module works correctly**. Signals are printed every clock cycle.

---


**Observation / Proof:**

- PC increments correctly every clock cycle ✅  
- ADD and SUB instructions detected correctly ✅  
- Invalid instruction (NOP/ADDI) handled (valid_instr=0) ✅  
- End-to-end fetch → decode → control path verified ✅  

NOTE: **proofs are availble**
---


---

## Notes / Key Points

- Top module **exposes all important signals** for testbench verification.
- Fetch → decode → control path is fully functional.
- Ready for **Day-6: Illegal instruction & fault handling**.
- All modules are **combinational/synchronous safe** with default values.
- Simulation outputs serve as **proof of correct integration**.

---

**Author:** Gunja Prasanth  
**Task:** Day-5 of RISC-V Control Subsystem Project

----
