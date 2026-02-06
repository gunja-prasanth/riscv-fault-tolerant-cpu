## 🟢 Day-26: Activity Monitor RTL

### Overview
This phase introduces a **passive activity monitoring block** that observes
control-level behavior of the fault-tolerant RISC-V subsystem without affecting
functional execution.

The activity monitor is designed to be **non-intrusive**, synthesizable, and
reset-safe, enabling early-stage analysis of control behavior.

---

### What Is Implemented
✔ FSM state transition counter  
✔ PC write toggle counter  
✔ Recovery-active cycle counter  

All counters operate purely in observation mode and do **not** feed back into
the control path.

---

### Design Characteristics
- **Passive**: No outputs drive system behavior  
- **Reset-safe**: All counters reset cleanly  
- **Synthesizable**: No simulation-only constructs  
- **Non-intrusive**: Functional waveform remains unchanged  

---

### Verification Strategy
- Integrated into the existing top-level design
- Validated through system-level behavioral simulation
- Identical waveform behavior before and after integration confirms
  non-intrusive operation

No dedicated testbench is added at this stage, as the activity monitor is
verified indirectly through successful system execution.

---

### Key Takeaway
This step establishes the foundation for **activity-aware estimation** by
capturing control-level events while preserving functional correctness.
