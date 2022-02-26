#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
(
    cd ~/.config/private-files
    tar -cvzf - * | gpg -c > $SCRIPT_DIR/private-files.tar.gz.gpg
)

rm -r ~/.config/private-files