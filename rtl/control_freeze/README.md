# 🟦 Day-13: Control Freeze Logic

---

## 🎯 Objective
The objective of **Day-13** is to prevent **state corruption** when a fault is detected by
**freezing all critical write operations** in the CPU.

This logic ensures that no irreversible updates occur while the system is in a fault or recovery phase.

---

## 🛑 Why Control Freeze is Required

During a fault:
- Updating the **Program Counter (PC)** can lead to instruction loss
- Writing to the **register file** can corrupt architectural state
- Writing to **memory** can permanently damage data

➡️ The safest action is to **block all write enables** until recovery completes.

---

## 🧩 Control Freeze Functionality

When `freeze_en = 1`:
- ❌ PC updates are blocked
- ❌ Register writes are blocked
- ❌ Memory writes are blocked

When `freeze_en = 0`:
- ✅ All control signals pass through normally

---

## 🔌 Module Inputs

| Signal | Description |
|------|-------------|
| `freeze_en` | Indicates fault / freeze condition |
| `pc_write_in` | Original PC write enable |
| `reg_write_in` | Original register write enable |
| `mem_write_in` | Original memory write enable |

---

## 📤 Module Outputs

| Signal | Description |
|------|-------------|
| `pc_write_out` | Gated PC write enable |
| `reg_write_out` | Gated register write enable |
| `mem_write_out` | Gated memory write enable |

---

## 🧠 RTL Behavior (Logic Summary)

if freeze_en == 1
pc_write_out = 0
reg_write_out = 0
mem_write_out = 0
else
pc_write_out = pc_write_in
reg_write_out = reg_write_in
mem_write_out = mem_write_in


---

## 🧱 Architecture View (ASCII)

      pc_write_in  ──┐
                      ├── MUX ──> pc_write_out
      freeze_en   ────┘

      reg_write_in ──┐
                      ├── MUX ──> reg_write_out
      freeze_en   ────┘

      mem_write_in ──┐
                      ├── MUX ──> mem_write_out
      freeze_en   ────┘

---

## 🧪 Verification

Behavioral simulation confirms:

✔ Write enables pass through when `freeze_en = 0`  
✔ All write enables are forced LOW when `freeze_en = 1`  
✔ No write occurs during fault condition  

📸 Waveform proof captured to validate **no-write-during-fault** behavior.

----