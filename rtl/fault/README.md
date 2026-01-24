# 🟦 Day-9: Fault Classification

---

## 🎯 Objective
The objective of **Day-9** is to classify detected faults into meaningful categories so that the processor can take appropriate corrective actions.  
Instead of treating all faults equally, this module clearly differentiates between **minor faults** and **critical faults**.

---

## 🧩 Fault Categories

| 🏷 Fault Type | 🔢 Code | 📝 Description |
|-------------|--------|----------------|
| ✅ No Fault | `00` | Normal operation |
| ⚠️ Minor Fault | `01` | Recoverable or non-fatal fault |
| ❌ Critical Fault | `10` | Severe fault requiring immediate action |

---

## 🏗️ Design Overview

The **`fault_classifier`** module analyzes incoming fault indicators and produces a **2-bit fault classification output**.

---

### 🔌 Inputs
- **`illegal_opcode`**  
  ➤ Indicates an unsupported or invalid instruction.
- **`invalid_control`**  
  ➤ Indicates illegal or unsafe control signal combinations.
- **`stuck_at_fault`**  
  ➤ Indicates a permanent hardware fault (**highest priority**).

---

### 📤 Output
- **`fault_type [1:0]`**  
  ➤ Encoded representation of the detected fault category.

---

## 🥇 Priority Rule

Faults are classified using the following **strict priority order**:


1. ❌ **Critical Fault** → `stuck_at_fault`
2. ⚠️ **Minor Fault** → `illegal_opcode` OR `invalid_control`
3. ✅ **No Fault**

➡️ This ensures that **severe hardware faults always override minor issues**.

---

## 🧠 RTL Behavior (Logic Summary)

```text
if (stuck_at_fault)
    fault_type = 10   // ❌ CRITICAL FAULT
else if (illegal_opcode OR invalid_control)
    fault_type = 01   // ⚠️ MINOR FAULT
else
    fault_type = 00   // ✅ NO FAULT

---

## proofs are available in sim_proofs section