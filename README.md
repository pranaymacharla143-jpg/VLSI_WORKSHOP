# VLSI Design, RTL Synthesis & Physical Design Workshop

A hands-on learning repository documenting practical work across the digital VLSI design flow—from Verilog RTL design and simulation to logic synthesis, gate-level verification, physical design, and static timing analysis (STA).

The repository contains day-wise RTL experiments, simulation waveforms, synthesis views, physical-design evidence, and documentation for a VSDBabySoC timing-analysis workflow.

## Objectives

- Understand combinational and sequential digital design using Verilog RTL.
- Verify design behavior through simulation and waveform inspection.
- Observe how synthesis optimizes RTL and maps it into hardware structures.
- Compare RTL, pre-synthesis, and post-synthesis representations.
- Explore physical-design stages such as floorplanning, placement, clock-tree synthesis, routing, and layout inspection.
- Review timing reports and STA results for the documented design flow.

## Repository Structure

```text
VLSI_WORKSHOP-main/
├── Day_1/                         # RTL design and simulation: 2:1 MUX
├── Day_2/                         # Sequential logic, reset/set, arithmetic and hierarchy
├── Day_3/                         # Combinational/sequential optimization
├── Day_4/                         # Gate-level simulation concepts and RTL coding styles
├── Day_5/                         # Synthesis optimization, if/case, MUX/DEMUX and adder
├── Day_6/                         # Pre-synthesis and post-synthesis comparison
├── Day_7/                         # Sequence detector design and verification
├── LabWork_RTL_GLS_TEST/          # Lab screenshots and screenshot index
├── Physical_design/
│   ├── Module_1/                  # Synthesis and initial physical-design setup
│   ├── Module_2/                  # Floorplanning, PDN and layout evidence
│   ├── Module_3/                  # Circuit/layout and SPICE-related exercises
│   ├── Module_4/                  # Placement, CTS and timing evidence
│   └── Module_5/                  # Detailed routing and post-route checks
└── VSDBabySoC_STA_Documentation/
    ├── docs/                      # Project overview, workflow, results and limitations
    ├── screenshots/               # STA and physical-design evidence
    └── scripts/                   # Helper scripts for inspecting STA results
```

Each day or module folder may include its own README and images. Refer to the local README for experiment-specific details and filenames.

## Topics Covered

### RTL design and simulation
- 2:1 multiplexer design and waveform verification
- D flip-flops with asynchronous reset and set
- Multi-module and hierarchical RTL
- Arithmetic examples, including multiplier experiments and a ripple-carry adder
- Sequence detector design and state-based behavior

### Synthesis and verification
- RTL elaboration and synthesis
- Synthesized netlist and schematic inspection
- Pre-synthesis versus post-synthesis comparison
- Gate-level simulation concepts
- Blocking and non-blocking assignment considerations
- Complete and incomplete `if`/`case` assignments
- Synthesis optimization and hardware inference

### Physical design and timing
- Sky130-oriented physical-design exercises
- Floorplanning and power distribution network (PDN) evidence
- Placement and clock-tree synthesis (CTS)
- Timing reports and slack inspection
- Global/detailed routing evidence
- Layout inspection using Magic
- VSDBabySoC static timing analysis documentation

## Tools and Technologies

The repository documents workflows and results involving tools such as:

- **Verilog HDL** — RTL design
- **Icarus Verilog** — RTL simulation, where used
- **GTKWave** — waveform viewing
- **Yosys** — logic synthesis and netlist inspection
- **OpenROAD / OpenSTA** — physical-design and timing-analysis workflow
- **Magic** — layout viewing and inspection
- **Sky130** — open-source process-design-kit ecosystem used in the documented flow
- **SPICE / ngspice** — circuit-level exercises where documented

Tool availability and exact commands depend on the experiment and local environment. Check each module's README before running a flow.

## How to Explore the Repository

1. Clone or download the repository.
2. Open `Day_1/README.md` and proceed through the day-wise folders in order.
3. Review the accompanying `images/` folders to compare waveforms, netlists, and schematics with each experiment's explanation.
4. Explore `LabWork_RTL_GLS_TEST/README.md` and `SCREENSHOT_INDEX.md` for the lab evidence index.
5. Continue with `Physical_design/Module_1/` through `Module_5/` for the physical-design exercises.
6. Read `VSDBabySoC_STA_Documentation/docs/PROJECT_OVERVIEW.md` and `STA_WORKFLOW.md` for the BabySoC STA documentation.

## Running Experiments

There is no single command that runs every experiment in this repository. Each experiment may have different source files, testbenches, libraries, constraints, and tool requirements.

For a Verilog experiment, the general workflow is:

1. Locate the RTL source and its testbench in the relevant module.
2. Read that module's README for the intended top module and tool commands.
3. Compile and run the testbench using the simulator configured for that experiment.
4. Open the generated waveform in GTKWave, if a waveform file is produced.
5. Run synthesis using the documented script or command and inspect the resulting netlist or schematic.

For physical-design and STA experiments, follow the setup instructions and scripts in the relevant module or in `VSDBabySoC_STA_Documentation/docs/`. Paths, PDK installation, environment variables, libraries, and timing constraints must match your local setup.

## Results and Evidence

The repository includes visual evidence such as simulation waveforms, synthesized netlists/schematics, placement and routing views, and STA-related terminal outputs. These artifacts are intended to help explain the design flow and compare results between stages. Numerical results and completion status should be interpreted from the corresponding module documentation and reports.

## Learning Outcomes

After working through the documented exercises, a learner should be better able to:

- Read and write basic combinational and sequential RTL.
- Verify functional behavior using testbenches and waveforms.
- Recognize common RTL coding patterns that affect inferred hardware.
- Interpret synthesis results and understand optimization at a basic level.
- Identify major stages in a standard-cell physical-design flow.
- Read timing reports and understand the role of STA constraints and timing paths.

## Limitations

- Some folders are documentation and evidence collections rather than standalone, fully automated projects.
- Tool versions, PDK files, libraries, and environment configuration can affect whether commands run unchanged.
- Images and screenshots demonstrate selected steps; they do not by themselves guarantee that every flow can be reproduced on another machine.
- Consult each module's README for experiment-specific prerequisites, commands, and known limitations.

## License and Attribution

This repository is shared for learning and educational reference. If you reuse code, documentation, or images from external sources, retain the applicable copyright notices and provide attribution as required by the original license. Add a repository license file if you intend to specify formal reuse permissions.

---

**Note:** This README describes the repository at a high level. The README files inside individual folders provide the detailed steps and results for each experiment.
