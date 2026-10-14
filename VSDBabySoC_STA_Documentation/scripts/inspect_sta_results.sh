#!/usr/bin/env bash
# Helper to locate STA reports in an OpenROAD-flow-scripts workspace.
# Run from the flow/ directory. This script only lists files; it does not alter results.
set -eu

if [ ! -d "reports/sky130hd/vsdbabysoc" ]; then
  echo "Expected reports/sky130hd/vsdbabysoc not found."
  echo "Run this script from the OpenROAD-flow-scripts/flow directory."
  exit 1
fi

echo "=== STA-related report files ==="
find reports/sky130hd/vsdbabysoc -type f \
  \( -iname '*sta*' -o -iname '*setup*' -o -iname '*hold*' -o -iname '*timing*' \) \
  -print | sort

echo
echo "=== Corner log files (if present) ==="
find reports results -type f \
  -path '*vsdbabysoc*' \
  \( -path '*corner*' -o -path '*16corners*' \) \
  -type f -print 2>/dev/null | sort || true
