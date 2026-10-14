# Results and Limitations

## 1. Evidence included

The screenshots supplied with this archive show examples of:

- Synthesis statistics and standard-cell counts.
- OpenSTA timing-path output.
- Multi-corner STA log summaries.
- A setup/max-delay path marked as violated in a displayed report.
- OpenROAD floorplan and placement views.
- A detailed-routing view with multiple metal and via layers.
- Commands and terminal output used during the workflow.

See the image files in `screenshots/`. The terminal images are evidence snapshots, not machine-readable replacements for the original logs.

## 2. How to interpret the visible timing output

Some supplied terminal screenshots show negative slack and a timing path marked `VIOLATED`. Such a result means the specific reported path/check did not meet its requirement for that run. It should not be described as a passing result.

The screenshots also show multiple PVT-corner log files and values that vary by corner. Because images may come from different runs, stages, or constraint/parasitic setups, do not combine values from different screenshots into a single table unless the original raw logs confirm that they are directly comparable.

## 3. Why different reports may disagree

Timing summaries can differ because of:
- Different flow stages, such as global route versus detailed route.
- Different Liberty corners.
- Different SDC constraints or clock definitions.
- Different parasitic extraction and RC assumptions.
- Different tool settings or versions.
- Changes to the design or physical database between runs.

Therefore, each reported value should include the stage, corner, source report, and relevant setup information.

## 4. Follow-up checks

1. Open the raw setup and hold reports for every required corner.
2. Identify the worst startpoint and endpoint for each failing check.
3. Review cell delays, net delays, clock skew, and clock uncertainty.
4. Confirm the SDC clock period, input/output delays, and exceptions.
5. Check whether the parasitic model is valid for the analyzed corner.
6. Review routing DRC and fanout reports independently of STA.
7. Rerun the flow after any fix and preserve the updated logs.

## 5. Reporting language

Use precise wording such as:

> “The supplied report shows a negative slack for the identified path at the stated analysis corner. The path and constraints require further investigation.”

Avoid claims such as “all corners pass” unless the raw reports demonstrate that every required setup and hold check meets the project’s acceptance criteria.

## 6. Data limitation

The numeric details in this document are intentionally not consolidated into a new authoritative timing table. The provided evidence consists of screenshots from terminal and GUI sessions, and the original raw report files are not included in this archive. Use the original report files from the Codespace for exact values.
