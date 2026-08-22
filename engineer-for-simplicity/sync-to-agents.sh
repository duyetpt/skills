#!/usr/bin/env bash

set -euo pipefail

source_dir="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)"
target_dir="/Users/mac/.agents/skills/engineer-for-simplicity"

if [[ "$source_dir" == "$target_dir" ]]; then
  printf 'Source and target directories must be different.\n' >&2
  exit 1
fi

if ! command -v rsync >/dev/null 2>&1; then
  printf 'rsync is required but was not found in PATH.\n' >&2
  exit 1
fi

mkdir -p "$target_dir"

rsync \
  --archive \
  --delete \
  --exclude='.git/' \
  "$source_dir/" \
  "$target_dir/"

printf 'Synced %s -> %s\n' "$source_dir" "$target_dir"
