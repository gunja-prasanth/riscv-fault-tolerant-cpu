# 🟦 Day-14: Recovery Action Logic

---

## 🎯 Objective
The objective of **Day-14** is to implement **active recovery mechanisms** that allow the CPU to
**safely continue execution after a fault**, instead of only stopping operation.

This stage moves the design from **damage prevention** to **fault recovery**.

---

## 🧠 Why Recovery Actions Are Needed

Freezing the CPU prevents corruption, but does not solve the problem.  
To recover safely, the processor must:

- 🔄 Roll back execution to a safe point
- 🚫 Prevent execution of faulty instructions
- 🔁 Retry instruction execution cleanly

This logic enables those recovery actions.

---

## 🧩 Recovery Actions Implemented

### 🔄 PC Rollback
- Restores the Program Counter to a previously saved safe value
- Ensures the CPU does not continue from a corrupted state

### 🚫 NOP Insertion
- Replaces the next instruction with a **NOP**
- Prevents execution of potentially faulty instructions

### 🔁 Retry Logic
- Enables controlled re-execution of instructions
- Allows the CPU to resume normal operation after recovery

---

## 🔌 Module Inputs

| Signal | Description |
|------|-------------|
| `recovery_en` | Enables recovery actions |
| `pc_current[31:0]` | Current Program Counter |
| `pc_saved[31:0]` | Last known safe Program Counter |

---

## 📤 Module Outputs

| Signal | Description |
|------|-------------|
| `pc_next[31:0]` | Next Program Counter value |
| `insert_nop` | Indicates NOP insertion |
| `retry_en` | Enables instruction retry |

---

## 🧠 RTL Behavior (Logic Summary)

if recovery_en == 1
pc_next = pc_saved
insert_nop = 1
retry_en = 1
else
pc_next = pc_current
insert_nop = 0
retry_en = 0

---

## 🧱 Architecture View (ASCII)

pc_current ──┐
├── MUX ──> pc_next
pc_saved ───┘
^
|
recovery_en

recovery_en ───────────> insert_nop
recovery_en ───────────> retry_en


---

## 🧪 Verification

Behavioral simulation confirms:

✔ PC rolls back when recovery is enabled  
✔ NOP insertion is asserted during recovery  
✔ Retry signal is asserted correctly  
✔ Normal execution resumes after recovery  

📸 Waveform proof captured to validate recovery behavior.

---

