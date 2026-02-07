## 🟢 Day-27: Power Estimator RTL

### Overview
This phase introduces a **lightweight, activity-weighted power estimation
block** that maps control-level activity metrics to a **relative power proxy**.

The estimator operates entirely at the RTL level and is designed for
**early-stage analysis**, without relying on technology-specific or
post-synthesis power models.

---

### What Is Implemented
✔ Parameterized weighted mapping of activity counters  
✔ Aggregation of FSM transitions, PC write toggles, and recovery cycles  
✔ Reset-safe and fully synthesizable estimation logic  

The generated output represents a **relative power indicator**, not an
absolute power measurement.

---

### Design Characteristics
- **Technology-agnostic**: No voltage, frequency, or process assumptions  
- **Non-intrusive**: Estimator does not affect functional execution  
- **Configurable**: Activity weights exposed as parameters  
- **Synthesizable**: Uses only standard RTL constructs  

---

### Verification Strategy
- Integrated into the design hierarchy without altering existing control paths  
- Validated through system-level behavioral simulation  
- Identical functional waveforms before and after integration confirm
  safe, non-intrusive operation  

No dedicated testbench is added at this stage, as the estimator logic is
verified in the context of overall system execution.

---

### Key Takeaway
This step completes the **activity-to-power mapping stage**, enabling
control-level power trend analysis while preserving functional correctness.
