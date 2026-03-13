#!/usr/bin/env python3
"""
PreToolUse hook (Bash matcher)
Runs your test suite before any git commit. Blocks the commit if tests fail,
giving Claude the output so it can fix the issue before retrying.

SETUP: Set the TEST_COMMAND variable below to your project's test command.
Examples:
  TEST_COMMAND = "npm test"
  TEST_COMMAND = "pytest"
  TEST_COMMAND = "cargo test"
  TEST_COMMAND = "go test ./..."
  TEST_COMMAND = None  # disables this hook
"""
import json
import os
import re
import subprocess
import sys

TEST_COMMAND = None  # <-- set this when you start a project

data = json.load(sys.stdin)
command = data.get("tool_input", {}).get("command", "")

# Only intercept git commit commands
if not re.match(r"git\s+commit\b", command.strip()):
    sys.exit(0)

if not TEST_COMMAND:
    sys.exit(0)

cwd = data.get("cwd", ".")
result = subprocess.run(
    TEST_COMMAND,
    shell=True,
    cwd=cwd,
    capture_output=True,
    text=True,
)

if result.returncode != 0:
    output = (result.stdout + result.stderr).strip()
    print(f"Tests failed — commit blocked.\n\n{output}", file=sys.stderr)
    sys.exit(2)

sys.exit(0)
