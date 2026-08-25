#!/usr/bin/env bash

set -euo pipefail

if ! command -v rsync >/dev/null 2>&1; then
  printf 'rsync is required but was not found in PATH.\n' >&2
  exit 1
fi

rsync -av --exclude '.git' --exclude '.DS_Store' --exclude 'AGENTS.md' --exclude 'README.md' --exclude '*.sh' ./ ~/.agents/skills/
