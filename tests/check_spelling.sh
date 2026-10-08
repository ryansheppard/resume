#!/usr/bin/env bash
set -euo pipefail

if ! command -v hunspell >/dev/null 2>&1; then
    echo "ERROR: hunspell and its en_US dictionary are required." >&2
    exit 1
fi

if ! words=$(hunspell --no-default-personal -d en_US -i UTF-8 -p "$2" -l < "$1"); then
    echo "ERROR: hunspell failed; check that the en_US dictionary is installed." >&2
    exit 1
fi

if [[ -n "$words" ]]; then
    echo "ERROR: unrecognized words in $1 (review valid names before adding them to $2):" >&2
    LC_ALL=C sort -u <<< "$words" >&2
    exit 1
fi

echo "PASS: resume spelling checked."
