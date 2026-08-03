# Signal Processing Projects

Experimental vibration analysis and digital signal processing work carried out during my MSc in Mechanical Engineering at **Politecnico di Torino** (Vibration Mechanics).

Both projects follow the same pipeline that underpins industrial condition monitoring: **acquire accelerometer data → pre-process → transform to the frequency domain → extract modal parameters → validate against a physical model**.

---

## Contents

### `Scaled_Bridge_Structure_Scrimali_S3298326.pdf`
**Experimental modal analysis of a scaled bridge structure (simply-supported aluminium beam, 186 × 15 × 1.5 cm).**

- Test design: 8 accelerometers positioned off the modal nodes, with off-axis placement to discriminate torsional modes from bending modes
- Three impulse-response acquisitions at 256 Hz and 512 Hz sampling frequency, 20 s each
- Time-domain inspection of all 8 channels, windowing of the decaying response, channel selection by noise level
- **Power Spectral Density** (per-channel and summed) for preliminary identification of eigenfrequencies — 8 candidate resonance peaks
- **Complex Exponential Method** implemented in MATLAB for modal parameter estimation (eigenfrequencies, damping ratios, poles)
- **Stabilization diagram** to separate physically stable modes from computational modes caused by numerical error, noise and model over-ordering
- Mode shape reconstruction from amplitude and phase across the measurement grid
- Cross-validation against the analytical Euler–Bernoulli solution

**Identified modes:** 9.91 / 41.22 / 77.60 / 119.27 Hz, consistent with the PSD peak estimates (10.07 / 41.13 / 77.66 / 119.37 Hz).

---

### `DEXPILAB1_report.pdf`
**Free vibration of a cantilever beam with a tip mass — SDOF identification from acceleration data.**

- Aluminium cantilever (3 × 30 mm section) with lumped tip mass, two accelerometers, sampling frequency 2048 Hz
- **Logarithmic decrement** applied over 10 periods on the log-envelope of the acceleration signal to estimate the modal damping ratio
- Damped and undamped natural frequency estimation from the identified period and damping ratio
- **FFT** of the free response to confirm the dominant frequency and identify measurement noise contributions
- Parametric campaign over three configurations (tip mass 0.2 / 0.46 kg, free length 37 / 45 cm) quantifying the effect of mass and stiffness on the first natural frequency
- Comparison with continuous Euler–Bernoulli beam theory including the added-mass boundary condition

---

## Signal processing methods

| Area | Techniques |
|---|---|
| Acquisition | Multi-channel accelerometer setup, sampling frequency selection, sensor placement w.r.t. modal nodes |
| Time domain | Impulse/free-response analysis, log-envelope, logarithmic decrement, record trimming |
| Frequency domain | FFT, Power Spectral Density, resonance peak identification, noise discrimination |
| System identification | Complex Exponential Method, stabilization diagrams, pole/damping estimation, model-order selection |
| Modal analysis | Eigenfrequencies, damping ratios, mode shapes from amplitude and phase |
| Validation | Analytical Euler–Bernoulli model, experimental vs. theoretical comparison |

**Tools:** MATLAB

---

## Why this matters

Extracting damping, resonances and mode shapes from noisy accelerometer signals is the foundation of **vibration-based condition monitoring and predictive maintenance** for rotating machinery and civil/industrial structures. The same chain — acquire, condition, transform, extract features, validate against physics — is what I now apply to data-driven and AI-based diagnostics of industrial assets.

---

## Author

**Giuseppe Luciano Scrimali**
MSc Mechanical Engineering, Politecnico di Torino · Specializing Master in Artificial Intelligence (in partnership with NVIDIA)

[LinkedIn](https://www.linkedin.com/in/giuseppescrimali) · [GitHub](https://github.com/giuseppescrimali)

