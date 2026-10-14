# Module 9: PICORV32A RTL-to-GDSII Implementation Using OpenLane

This module covers the RTL-to-GDSII implementation flow of the PICORV32A RISC-V processor using the OpenLane ASIC design flow and the Sky130 standard-cell library. The workflow includes configuration setup, RTL synthesis, technology mapping, floorplanning, placement, clock tree synthesis (CTS), timing analysis, and physical-design inspection.

The implementation uses the PICORV32A Verilog design, timing constraints, Sky130 standard-cell libraries, and LEF files. OpenSTA is used to inspect timing reports, while TritonCTS generates the clock distribution network. The resulting reports and layout images help analyze the design at different implementation stages.

## Module Overview

### 1. Design Configuration and Timing Constraints

The initial stage configures the PICORV32A design and its timing requirements.

The configuration files specify the design name, Verilog source, SDC constraints, clock port, clock period, standard-cell libraries, and additional LEF files. The timing constraints define the clock, input delays, output delays, driving cell, and output load used during synthesis and timing analysis.

### 2. RTL Synthesis and Technology Mapping

The Verilog RTL is processed by Yosys through the OpenLane synthesis flow. The design is converted into a gate-level netlist using Sky130 standard cells.

Synthesis statistics show the number and types of mapped cells and the estimated design area. Comparing the reports before and after configuration fixes helps identify changes in the synthesis results.

### 3. Floorplanning and Die/Core Area

Floorplanning defines the initial physical dimensions of the design, including the die area and core area. The core contains the standard-cell placement region, while the die represents the overall chip boundary.

The floorplan reports provide the physical coordinates and dimensions used by subsequent placement and routing stages.

### 4. Standard-Cell Placement

During placement, the synthesized standard cells are assigned physical locations within the core area. The placement process considers cell density, connectivity, and timing requirements.

The placement layout and design statistics provide information about the distribution of cells, total instances, net count, utilization, and placement displacement.

### 5. Clock Tree Synthesis (CTS)

Clock Tree Synthesis constructs a clock distribution network for sequential elements in the PICORV32A design.

TritonCTS inserts clock buffers and builds a clock tree to distribute the clock signal. The CTS reports provide the number of sinks covered, clock buffers created, and maximum clock-tree level.

Clock skew and post-CTS timing reports are used to examine clock arrival-time differences and the effect of the clock tree on setup timing.

### 6. Static Timing Analysis Using OpenSTA

OpenSTA analyzes timing paths using the timing constraints and standard-cell library models. Setup timing reports identify startpoints, endpoints, cell delays, clock arrival times, data arrival times, required times, and slack.

Positive slack indicates that a path meets the corresponding timing requirement, whereas negative slack indicates a timing violation for that path and analysis condition.

The post-CTS timing report is particularly useful because it includes the clock network created during CTS rather than relying only on an ideal clock model.

### 7. Physical Layout and Library Inspection

The module also includes inspection of the Sky130 inverter cell layout in Magic and its LEF representation.

Magic provides a visual view of physical layers such as poly, diffusion, metal, and nwell. LEF files describe abstract cell geometry, dimensions, pins, and physical-design information used by implementation tools.

## Learning Objectives

- Understand the OpenLane RTL-to-GDSII design flow.
- Configure PICORV32A design files and timing constraints.
- Understand the role of Verilog RTL, SDC, LEF, and Liberty files.
- Examine synthesis and technology-mapping statistics.
- Interpret die area, core area, cell utilization, and placement reports.
- Understand the role of TritonCTS in clock-tree construction.
- Inspect clock buffers, clock-tree depth, and clock skew.
- Read OpenSTA setup timing reports and interpret slack.
- Compare timing results before and after clock tree synthesis.
- Inspect a Sky130 standard-cell layout using Magic.
- Understand how physical implementation and timing constraints affect ASIC design quality.

## Overall Workflow

```text
PICORV32A Verilog RTL
        |
        v
Design Configuration and SDC Constraints
        |
        v
RTL Synthesis Using Yosys
        |
        v
Technology Mapping to Sky130 Cells
        |
        v
Floorplanning and Die/Core Definition
        |
        v
Standard-Cell Placement
        |
        v
Clock Tree Synthesis Using TritonCTS
        |
        v
Post-CTS Static Timing Analysis
        |
        v
Physical Layout and Report Inspection
```

## Screenshot-by-Screenshot Guide

The following sections describe the screenshots supplied for this module. The filenames below are the original screenshot filenames and can be used directly in the README when the images are stored in the repository.

### 1. Design Configuration and Library Setup

#### 1. `config_tcl(3).png` — PICORV32A Design Configuration

This screenshot shows the configuration file for the PICORV32A design. It identifies the design name, Verilog source file, SDC file, clock period, and clock port. It also shows how the design-specific standard-cell configuration is loaded when the corresponding file exists.

#### 2. `config_extra_lefs_and_libs.png` — Standard-Cell Libraries and LEF Files

This screenshot documents the additional LEF and timing-library configuration. The typical, fast, and slow Sky130 Liberty files provide cell timing models for different library corners. Additional LEF files supply physical cell information required by the implementation flow.

#### 3. `my_base_sdc.png` — Timing Constraint Configuration

This screenshot shows the base SDC configuration, including the clock port, clock period, synthesis driving cell, input and output delay percentages, and output capacitive load.

These constraints establish the timing environment used by synthesis and static timing analysis.

### 2. RTL Synthesis and Technology Mapping

#### 4. `synthesis_before_fix_stats.png` — Initial Synthesis Statistics

This screenshot records the initial synthesis statistics for PICORV32A. It provides a baseline for examining the mapped standard-cell distribution and estimated chip area before the configuration or RTL-related correction.

#### 5. `synthesis_after_fix_stats.png` — Updated Synthesis Statistics

This screenshot shows the synthesis statistics after the correction. Comparing the initial and updated reports helps identify changes in the number of mapped cells and the estimated design area.

The results should be interpreted using the exact synthesis settings and source revision associated with each report.

#### 6. `post_abc_mapped_statistics.png.png` — Post-ABC Technology Mapping

This screenshot shows the cell statistics after ABC technology mapping. ABC maps the synthesized logic into available Sky130 standard cells, such as logic gates, buffers, and sequential cells.

The mapped netlist is the starting point for the physical implementation stages.

### 3. Floorplanning and Physical Design

#### 7. `floorplan_die_core_area.png` — Die and Core Area Report

This screenshot displays the die-area and core-area coordinates reported by the OpenLane flow.

The die boundary defines the overall chip dimensions, while the core boundary defines the region used for standard-cell placement and physical implementation.

#### 8. `picorv32a_placement_layout.png` — PICORV32A Placement Layout

This image shows the physical placement representation of the PICORV32A design. The standard cells are distributed across the available placement region.

The layout provides a visual reference for the placement stage and illustrates the physical scale and density of the design.

#### 9. `placement_design_stats.png` — Placement Statistics

This screenshot shows the placement-stage design statistics, including total instances, nets, design area, utilization, row count, and placement displacement.

The reported values help evaluate how the synthesized netlist occupies the available core and how cells have been distributed during placement.

### 4. Clock Tree Synthesis

#### 10. `cts_tcl_run_cts.png` — TritonCTS Execution

This screenshot shows the relevant clock-tree synthesis configuration and execution commands in the OpenLane flow.

The CTS stage constructs a clock distribution network for the sequential elements. The implementation flow uses the generated clock-tree information for subsequent timing analysis.

#### 11. `tritoncts_stats.png` — Clock Tree Statistics

This screenshot records the TritonCTS statistics. The displayed results include the number of clock sinks covered, the number of clock buffers created, and the maximum clock-tree level.

These statistics help verify that the clock-tree construction stage executed and provide information about the resulting clock network.

#### 12. `picorv32_cts_def.png` — Post-CTS Physical Design

This image shows the PICORV32A physical-design representation associated with the clock-tree synthesis stage.

The DEF representation describes the physical locations and connectivity of design components. The CTS-stage DEF is useful for examining the implementation after clock-tree insertion.

#### 13. `cts_clock_skew.png` — Clock Skew Analysis

This screenshot records clock timing information, including clock latency, clock reconvergence pessimism, and skew.

Clock skew represents the difference in clock arrival times at relevant sequential elements. It influences setup and hold timing and must be evaluated together with the clock period and data-path delays.

### 5. Static Timing Analysis

#### 14. `cts_timing_slack.png` — Timing Slack Report

This screenshot shows a timing-path report with data arrival time, data required time, and slack.

Slack is the difference between the required time and arrival time under the applicable timing convention. Positive setup slack indicates that the analyzed path meets its timing requirement; negative setup slack indicates a violation.

The report should be evaluated together with the associated timing constraints and analysis corner.

#### 15. `opensta_rpt.png` — OpenSTA Timing Report

This screenshot shows an OpenSTA timing report containing path information for sequential elements and standard-cell logic.

The report identifies timing startpoints and endpoints and lists the cell and net delays contributing to the path. It helps locate timing-critical logic and understand the effect of individual gates on the overall path delay.

#### 16. `post_cts_real_clock_sta.png` — Post-CTS Timing Analysis

This screenshot shows post-CTS timing results with clock-network information included in the timing calculation.

The displayed examples contain negative slack values, indicating setup timing violations for the reported paths under the applied constraints. These violations identify paths that may require optimization, such as logic restructuring, cell sizing, placement improvement, or clock-tree refinement.

The reported slack values should not be treated as proof of timing closure; additional optimization and verification may be required.

### 6. Sky130 Standard-Cell Layout

#### 17. `sky130_inv_lef.png` — Sky130 Inverter LEF

This screenshot displays the abstract LEF representation of the `sky130_inv` standard cell.

The LEF definition includes the cell dimensions and physical pin information for input, output, power, and ground. These details help explain how a standard cell is represented for placement and routing.

#### 18. `checking_inv_magic_layout.png` — Inverter Layout in Magic

This screenshot shows the Sky130 inverter layout opened in Magic. The visible geometry includes transistor-related layers and interconnect structures.

The Magic `what` command identifies selected mask layers, including nwell, poly, metal, ndiff, and pdiff. This inspection connects the abstract standard-cell description to its physical layout representation.

## Important Results and Observations

The supplied screenshots document several stages of the PICORV32A implementation process.

- **Synthesis:** The Yosys and ABC reports show the mapped standard-cell composition and estimated design area.
- **Floorplanning:** The die and core reports establish the physical implementation boundaries.
- **Placement:** The placement statistics show the instance count, utilization, and physical distribution of cells.
- **Clock Tree Synthesis:** TritonCTS reports the clock sinks covered, buffers created, and clock-tree depth.
- **Timing Analysis:** OpenSTA reports identify critical paths and show whether the analyzed setup constraints are met.
- **Physical Inspection:** Magic and LEF screenshots demonstrate the relationship between standard-cell geometry and physical-design information.

The post-CTS timing screenshots contain negative slack for the illustrated paths. Therefore, these results demonstrate timing analysis and violation identification, rather than confirmed timing closure.

## Conclusion

This module demonstrates an RTL-to-physical-design workflow for the PICORV32A processor using OpenLane and the Sky130 standard-cell library. The synthesis, floorplanning, placement, CTS, and OpenSTA stages provide insight into the transformation of RTL into a physical implementation and the evaluation of its timing behavior.

The reports also demonstrate the importance of timing constraints, clock distribution, physical cell placement, and standard-cell library configuration. Magic layout inspection provides additional understanding of the physical structures used in Sky130 standard cells.

Overall, the module builds practical knowledge of ASIC implementation, physical-design reporting, clock-tree analysis, and static timing verification.

## Tools and Technologies

| Tool / Technology | Purpose |
|---|---|
| OpenLane | RTL-to-GDSII implementation flow |
| Yosys | RTL synthesis |
| ABC | Logic optimization and technology mapping |
| Sky130 PDK | CMOS technology and standard-cell resources |
| Liberty (`.lib`) | Standard-cell timing models |
| LEF | Abstract physical cell geometry |
| SDC | Timing constraints |
| TritonCTS | Clock tree synthesis |
| OpenSTA | Static timing analysis |
| Magic | Physical layout inspection and DRC |
| DEF | Physical implementation data |

## Author

- **Name:** M. Pranay Kumar
- **Roll No.:** 25EG504E02
- **College:** Anurag University
