# Project Overview: VSDBabySoC

## 1. Introduction

VSDBabySoC is a small system-on-chip design used here to practice the digital implementation flow and static timing analysis on the SkyWater SKY130HD standard-cell platform. The work shown in the supplied evidence includes synthesis output, OpenROAD physical-design views, and OpenSTA timing-path reports.

The purpose of this repository is to document the engineering workflow and preserve supporting evidence in a structure that can be reviewed through GitHub.

## 2. Project objectives

- Identify the source, testbench, constraints, and platform dependencies.
- Understand how synthesis maps RTL into standard cells.
- Observe floorplanning and placement.
- Review clock-related timing paths after implementation.
- Inspect routed interconnect and extracted parasitics.
- Compare timing behavior across process-voltage-temperature (PVT) corners.
- Keep the project reproducible and distinguish verified results from assumptions.

## 3. Design flow at a glance

```text
RTL + libraries + constraints
            |
            v
       RTL synthesis
            |
            v
      Floorplanning
            |
            v
        Placement
            |
            v
 Clock-tree synthesis (CTS)
            |
            v
 Global routing / detailed routing
            |
            v
 Parasitic extraction (SPEF)
            |
            v
 Static timing analysis (STA)
            |
            v
 Review reports, violations, and signoff criteria
```

## 4. Technology and tools

- **SKY130HD:** the standard-cell platform used for the shown flow.
- **OpenROAD-flow-scripts:** flow scripts and configuration for physical implementation.
- **OpenROAD GUI:** used to inspect floorplan, placement, and routed geometry.
- **OpenSTA:** used to calculate timing paths and report setup/hold slack.
- **Icarus Verilog / GTKWave:** possible tools for RTL simulation and waveform inspection when compatible source files and dependencies are available.

Tool versions, platform files, libraries, environment variables, and constraints should be recorded for reproducibility.

## 5. Design inputs to preserve

When adding the actual source tree, include the relevant items that are part of the project and permitted to redistribute:

- RTL modules and included Verilog headers.
- Testbench files and any test data.
- SDC timing constraints.
- OpenROAD design configuration such as `config.mk`.
- Library and PDK references (usually document their installation paths instead of copying licensed or very large PDK files).
- Scripts used to run synthesis, simulation, implementation, and STA.
- Raw timing reports and relevant run logs.

## 6. Expected outputs

Depending on the stages run, outputs may include a synthesized netlist, floorplan/placement/routing databases, extracted parasitics, timing reports, DRC reports, power reports, simulation waveforms, and run logs. These outputs are not interchangeable: a routed design database is not a simulation waveform, and a timing report is not a testbench.

## 7. Current archive scope

This ZIP contains documentation and supplied screenshots. It is not a substitute for the actual RTL and OpenROAD source tree. Add the source and raw reports from the active Codespace before claiming that a fresh user can reproduce the complete flow from this archive alone.
