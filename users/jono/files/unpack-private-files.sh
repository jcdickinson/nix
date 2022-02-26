#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
mkdir -p ~/.config/private-files
gpg -d $SCRIPT_DIR/private-files.tar.gz.gpg | tar -xvzf - -C ~/.config/private-files
