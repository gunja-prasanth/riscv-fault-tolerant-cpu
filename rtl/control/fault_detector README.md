# Fault Detection Logic — Day 7 ⚙️

## Overview ▸
This module implements **rule-based fault detection logic** for the RISC-V
control subsystem at the RTL level.

➤ The objective of this stage is **fault identification only**  
➤ No correction, masking, or recovery actions are performed  

The detector continuously observes decoded instruction and control signals
and flags conditions that may lead to **unsafe, undefined, or architecturally
invalid behavior**.

This strict separation between *detection* and *response* enforces clean
design layering and simplifies future integration of fault-handling
mechanisms.

✔ Implemented as **purely combinational RTL**  
✔ Suitable for early-stage safety analysis and system-level validation  

---

## Fault Classes Detected 🧩

### 1. Invalid Opcode
An instruction opcode that does not belong to the supported subset of the
RISC-V ISA implemented in this design.

**Rationale**
▸ For unsupported opcodes, the control unit cannot generate a valid or safe
  set of control signals  
▸ Allowing execution to proceed may result in undefined hardware behavior  

**Detection Rule**
➤ If the decoded opcode does not match any supported instruction class,  
  the instruction is flagged as **invalid**

---

### 2. Illegal Control Combination
A condition in which **mutually exclusive control signals** are asserted
simultaneously, or an instruction is treated as valid when no legal control
path exists.

**Representative Examples**
▸ `mem_read` and `mem_write` asserted together  
▸ `reg_write` asserted for an invalid or unsupported instruction  

**Rationale**
▸ These combinations violate architectural assumptions  
▸ They represent unsafe control behavior that must not propagate further  

**Detection Rule**
➤ Exactly one legal control path may be active per instruction cycle  

---

## Design Characteristics 🛠️
✔ Fully combinational implementation  
✔ No clock or sequential state dependencies  
✔ Rule-based logical evaluation of control and decode signals  
✔ Single consolidated output: `fault_detected`  
✔ Designed for seamless integration with future fault classification and
  recovery logic  

---

## Verification and Proof 📊
The fault detection logic has been validated using the following evidence:

✔ **Behavioral simulation**, demonstrating correct assertion of
  `fault_detected` for illegal opcode and control scenarios  

✔ **RTL elaborated schematic**, confirming correct logical structure,
  signal connectivity, and synthesis integrity  

Verification artifacts are included as supporting proof of correctness.

----