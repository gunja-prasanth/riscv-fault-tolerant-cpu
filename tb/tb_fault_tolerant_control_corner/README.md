# 🟩 Day-17: Corner Case Testing

## 🎯 Objective
The goal of Day-17 is to **validate system robustness under extreme and abnormal conditions**.  
This day focuses on verifying that the **fault-tolerant control subsystem remains stable**, safe, and predictable even when faults occur in rapid or unexpected sequences.

---

## 🔍 Corner Cases Tested

### 1️⃣ Back-to-Back Faults
- Multiple faults occur in close succession
- New fault injected **before previous recovery completes**

**Expected Behavior**
- CPU control signals remain frozen
- No unsafe writes occur
- Recovery FSM handles repeated faults without entering an invalid state

---

### 2️⃣ Reset During Active Fault
- Global reset asserted while a fault is already active

**Expected Behavior**
- FSM returns cleanly to `NORMAL` state
- No residual fault effects after reset
- System resumes normal operation safely

---

## 🧠 Signals Observed

| Signal | Description |
|------|------------|
| `illegal_opcode` | Injected logical fault |
| `invalid_control` | Control corruption case |
| `stuck_at_fault` | Critical fault scenario |
| `pc_write_out` | PC write enable |
| `reg_write_out` | Register file write enable |
| `mem_write_out` | Memory write enable |
| `pc_next` | Next PC value |
| `insert_nop` | Pipeline neutralization |
| `retry_en` | Recovery retry trigger |

---

## 🧪 Verification Method

- Dedicated **corner-case testbench**
- Controlled fault injection timing
- Cycle-accurate waveform inspection
- Safety checks on all critical control paths

📂 **Testbench Location**
```
tb/tb_fault_tolerant_control_corner/
```

---

## 📈 Waveform Proof

✔ Back-to-back fault handling  
✔ Reset asserted during fault  
✔ No write enable glitches observed  
✔ Clean recovery behavior verified  

📸 Refer to waveform screenshots stored in this directory.

---

## ✅ Results Summary

✔ No PC / Register / Memory write during fault  
✔ FSM remains stable under repeated faults  
✔ Reset reliably clears fault state  
✔ System safely resumes normal execution  

---

## 🧠 Key Takeaway
This testing confirms that the fault-tolerant control logic is **robust against real-world corner cases**, making the design suitable for **research, safety-critical systems, and academic evaluation**.

---

## 🧾 Commit Information
```
Commit: Day-17: Corner case handling
```

---

🛡 **System Status:** Stable under stress  
