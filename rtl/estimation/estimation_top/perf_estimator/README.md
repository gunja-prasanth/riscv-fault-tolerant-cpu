## 🟢 Day-28: Performance Estimator RTL

### Overview
This phase introduces a **control-level performance estimation block**
that quantifies the **runtime overhead introduced by fault recovery
mechanisms** in the fault-tolerant RISC-V control subsystem.

The estimator operates purely at the RTL level and provides **relative
performance metrics** without making any timing, frequency, or
technology-specific assumptions.

---

### What Is Implemented
✔ Total execution cycle counter  
✔ Recovery-active cycle counter  
✔ Integer-based recovery overhead percentage calculation  

The performance overhead is computed as the ratio of recovery cycles
to total execution cycles.

---

### Design Characteristics
- **Passive observation**: Does not affect control flow or execution  
- **Technology-agnostic**: No clock frequency or timing assumptions  
- **Synthesizable**: Uses only RTL-compatible constructs  
- **Reset-safe**: All counters and outputs reset deterministically  

---

### Verification Strategy
- Integrated into the design without modifying existing control logic  
- Validated using system-level behavioral simulation  
- Identical functional waveforms before and after integration confirm
  non-intrusive behavior  

No dedicated testbench is added at this stage, as the estimator is
verified indirectly through successful system execution.

---

### Key Takeaway
This module enables **quantitative analysis of recovery-induced
performance overhead**, completing the control-level estimation
infrastructure for power and performance trade-off evaluation.
