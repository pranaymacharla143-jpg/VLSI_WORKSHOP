# Static Timing Analysis (STA) Workflow

## 1. What STA checks

Static timing analysis evaluates whether signal paths satisfy timing requirements without simulating every possible input sequence. It uses timing constraints, cell timing models, and estimated or extracted interconnect parasitics.

Two common checks are:

- **Setup:** data must arrive early enough before the capture clock edge.
- **Hold:** data must remain stable long enough after the relevant capture clock edge.

## 2. Slack interpretation

Slack is the difference between the required arrival time and the actual data arrival time, under the timing engine's conventions.

- **Positive slack:** the reported path meets that particular timing check.
- **Zero slack:** the path is exactly at the timing boundary.
- **Negative slack:** the reported path violates that particular check.

Always state whether a value is setup/max-delay slack or hold/min-delay slack, and identify the corner, design stage, constraints, and parasitic model.

## 3. Timing-path fields

When reviewing a report, record:

- Startpoint: the source pin or sequential element.
- Endpoint: the destination pin or sequential element.
- Path group: the timing group used for analysis, often a clock.
- Path type: `max` commonly corresponds to setup analysis; `min` commonly corresponds to hold analysis.
- Data arrival time: accumulated path delay.
- Data required time: time boundary imposed by the clock and constraints.
- Slack: margin to the timing requirement.

A useful investigation follows the path from startpoint to endpoint and checks cell delay, net delay, clock arrival, skew, uncertainty, and constraint assumptions.

## 4. PVT-corner analysis

PVT means process, voltage, and temperature. Standard-cell delay changes with process models, supply voltage, and temperature. A design can pass in one corner and fail in another.

For a defensible multi-corner comparison, verify:

1. The correct Liberty files are loaded for each corner.
2. The intended SDC constraints are active.
3. The extraction/parasitic assumptions are appropriate for the corner.
4. The timing reports were generated from the expected implementation stage.
5. Units and report formats are consistent across runs.

Do not treat a single global-route timing summary as proof that all custom or signoff corners pass.

## 5. Post-route timing

Post-route STA can include interconnect parasitics from extraction. This makes it more representative of the implemented physical design than a purely pre-layout estimate. Record which database and SPEF file were used.

## 6. Reproducibility checklist

- [ ] Record OpenROAD/OpenSTA and flow-script versions.
- [ ] Preserve the exact SDC and design configuration.
- [ ] Record Liberty corner files and RC/extraction settings.
- [ ] Keep raw setup and hold reports for every required corner.
- [ ] Record WNS and TNS with stage and corner labels.
- [ ] Preserve relevant DRC and fanout reports.
- [ ] Regenerate results after any RTL, constraint, or physical-design change.
