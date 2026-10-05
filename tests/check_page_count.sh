#!/usr/bin/env bash
set -euo pipefail

if ! command -v pdfinfo >/dev/null 2>&1; then
    echo "ERROR: pdfinfo is required (install poppler-utils / poppler)." >&2
    exit 1
fi

info=$(pdfinfo "$1")
pages=$(awk '$1 == "Pages:" { print $2 }' <<< "$info")
if [[ ! "$pages" =~ ^[0-9]+$ ]]; then
    echo "ERROR: could not determine PDF page count." >&2
    exit 1
fi

if [[ "$pages" != "1" ]]; then
    echo "ERROR: resume must be exactly one page; got $pages pages." >&2
    exit 1
fi

echo "PASS: resume is one page."
