#!/bin/bash
if command -v claude &>/dev/null; then
  echo "Claude Code already installed, skipping."
else
  curl -fsSL https://claude.ai/install.sh | env -u CLAUDECODE bash
fi
