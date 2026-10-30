#!/bin/bash
set -e

DSH_DIR="/home/dshuser/.dsh"
TUI_PROFILE_DIR="$DSH_DIR/profiles/tui"

# 1. Single-shot bootstrap for DSH TUI profile if missing
if [ ! -d "$TUI_PROFILE_DIR" ]; then
    echo "==> Initializing DSH TUI profile..."
    dsh plugin --profile tui add @deepseek-harness-tui/dsh-tui
fi

# 3. Hand off control to the requested command
exec "$@"