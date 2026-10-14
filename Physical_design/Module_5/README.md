# Module 10: Final Physical Design Steps

## Overview

This module covers the final physical-design stages of the Sky130 RTL-to-GDSII implementation flow. It focuses on routing, power-distribution network (PDN) generation, global routing, detailed routing, TritonRoute, and design-rule checking (DRC).

The objective is to understand how the physical connections between standard cells are completed, how power and ground are distributed across the chip, and how routing reports are used to evaluate the physical design.

## Objectives

- Understand maze routing and the Lee routing algorithm.
- Learn routing constraints and physical design rules.
- Generate and inspect a power-distribution network.
- Understand global routing and detailed routing.
- Study the operation and features of TritonRoute.
- Analyze routing reports, wire counts, via counts, and DRC violations.
- Collect implementation screenshots and final design reports.

## Tools and Technologies

| Tool / Technology | Purpose |
|---|---|
| OpenLane | ASIC physical-design flow |
| Sky130 PDK | Technology files and design rules |
| OpenROAD | Physical-design implementation |
| TritonRoute | Detailed routing |
| Magic | Layout inspection and design-rule checking |
| LEF / DEF | Physical cell and implementation data |
| SDC | Timing constraints |

## Module Contents

### 1. SKY130_D5_SK1 — Routing and Design-Rule Checking

#### Introduction

Routing connects the placed standard cells, clock network, power network, and input/output pins using physical metal layers and vias. The routing process must follow the technology's connectivity and geometric design rules.

Design-rule checking identifies physical violations, such as spacing, width, and connectivity problems, that must be investigated before the design can be considered ready for final layout generation.

#### Topics Covered

- Introduction to maze routing.
- Working principle of Lee's routing algorithm.
- Routing paths and obstacles.
- Routing constraints and metal-layer usage.
- Design-rule checking (DRC).
- Identification and analysis of routing violations.

#### Working Procedure

1. Review the physical-design database and routing configuration.
2. Study maze routing and the Lee routing algorithm.
3. Run the routing stage using the configured implementation flow.
4. Inspect the routed layout.
5. Run or review the applicable DRC checks.
6. Record the number and types of reported violations.

#### Expected Outputs

- Routing configuration and commands.
- Routed-layout screenshots.
- DRC report.
- Violation count and descriptions.
- Observations about routing quality.

### 2. SKY130_D5_SK2 — Power Distribution Network

#### Introduction

The power-distribution network supplies power and ground to the standard cells throughout the chip. It provides electrical connections between the power sources, core power structures, and cell power pins.

A PDN may include power rings, horizontal or vertical straps, standard-cell rails, and connections to the designated power and ground ports, depending on the design configuration.

#### Topics Covered

- Power-distribution network fundamentals.
- Power-grid configuration.
- Core power rails and straps.
- Power and ground connectivity.
- Global and detailed power routing.
- Inspection of the generated power network.

#### Working Procedure

1. Review the power-grid configuration for the Sky130 design.
2. Verify the power and ground net definitions.
3. Generate the power-distribution network using the implementation flow.
4. Inspect the generated physical structures.
5. Check power connectivity and review any reported errors.
6. Save screenshots and relevant reports.

#### Expected Outputs

- Power-grid configuration.
- Generated power-network data.
- Screenshots of power rails, straps, and rings where applicable.
- Power-connectivity check results.
- Observations about the power-distribution structure.

### 3. SKY130_D5_SK3 — TritonRoute Flow

#### Introduction

TritonRoute is a detailed-routing engine used in the OpenROAD physical-design flow. Detailed routing converts the approximate routing assignments from global routing into actual physical wire and via connections while respecting technology-specific design rules.

Routing reports help evaluate completion, connectivity, wire and via usage, and remaining physical violations.

#### Topics Covered

- TritonRoute architecture and features.
- Global-routing and detailed-routing differences.
- Detailed-routing stages.
- Routing optimization and design-rule constraints.
- Wire and via statistics.
- Analysis of the final routing report.

#### Working Procedure

1. Review the TritonRoute configuration and routing inputs.
2. Examine the global-routing results.
3. Run detailed routing through the configured flow.
4. Review routing logs and completion messages.
5. Inspect the routed physical layout.
6. Analyze wire counts, via counts, and DRC results.
7. Record any unresolved routing or connectivity issues.

#### Expected Outputs

- TritonRoute commands and configuration.
- Detailed-routing logs.
- Routed-layout screenshots.
- Wire and via statistics.
- DRC report and violation analysis.
- Final routing observations.

## Routing Concepts

### Global Routing

Global routing assigns approximate paths to nets and estimates the routing resources required across the chip. It helps determine whether the design can be routed within the available routing capacity.

### Detailed Routing

Detailed routing creates the actual physical wire segments and vias. It must satisfy the applicable metal-layer, spacing, width, connectivity, and other technology rules.

### Lee's Routing Algorithm

Lee's algorithm is a maze-routing method that explores a routing grid from a source toward a destination. It expands through available neighboring grid locations until it reaches the destination or determines that no path is available. A path can then be reconstructed through the explored grid.

### Design-Rule Checking

DRC verifies that the physical layout complies with the technology's geometric and connectivity requirements. Any reported violations should be reviewed and resolved as appropriate.

## Overall Physical-Design Workflow

```text
RTL Synthesis
      |
      v
Floorplanning
      |
      v
Standard-Cell Placement
      |
      v
Clock Tree Synthesis
      |
      v
Power Distribution Network
      |
      v
Global Routing
      |
      v
Detailed Routing
      |
      v
TritonRoute Reports
      |
      v
Design-Rule Checking
      |
      v
Final Layout and Verification
```

*Note: The exact stage order and available checks depend on the OpenLane/OpenROAD flow configuration.*

## Results and Observations

Use this section to document the actual results obtained during implementation.

| Parameter | Result |
|---|---|
| Design name | To be recorded |
| Technology | Sky130 |
| Power-distribution network | To be verified |
| Global routing | To be verified |
| Detailed routing | To be verified |
| Total wire count | To be recorded |
| Total via count | To be recorded |
| DRC violation count | To be recorded |
| Final layout status | To be verified |
| Timing result | To be recorded |

Do not mark a stage as completed until the corresponding log, report, or layout has been checked.

## Final Checklist

- [ ] Routing configuration reviewed.
- [ ] Maze routing and Lee's algorithm studied.
- [ ] Power-distribution network generated.
- [ ] Power and ground connectivity checked.
- [ ] Global routing completed.
- [ ] Detailed routing completed.
- [ ] TritonRoute logs reviewed.
- [ ] Routed layout inspected.
- [ ] Wire and via statistics recorded.
- [ ] DRC report collected and reviewed.
- [ ] Final timing and area reports collected.
- [ ] Final layout screenshots added to the repository.

## Repository Structure

Organize the module files using the following structure. Adjust the filenames to match the files actually generated by your flow.

```text
Module-5/
├── README.md
├── config/
│   └── routing_config.mk
├── screenshots/
│   ├── pdn_layout.png
│   ├── global_routing.png
│   ├── detailed_routing.png
│   └── final_layout.png
└── reports/
    ├── routing_report.txt
    ├── drc_report.txt
    └── timing_report.txt
```

The structure above is a suggested organization, not a list of files confirmed to exist in the repository.

## Conclusion

This module introduces the final physical-design stages of a Sky130 ASIC implementation. It explains routing, power distribution, global routing, detailed routing, TritonRoute, and design-rule checking.

By examining the generated layouts, logs, and reports, students can understand how physical connectivity is established and how implementation quality is evaluated. The collected evidence also helps identify routing problems, power-connectivity issues, and remaining design-rule violations before final design verification.

## Author

- **Name:** Macharla Pranay Kumar
- **Roll No.:** 25eg504e02
- **College:** Anurag University

