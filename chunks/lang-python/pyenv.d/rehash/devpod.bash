#!/usr/bin/env bash
shopt -s nullglob
devpod_shims=()
for file in "$PYENV_MIRROR"/user/*/bin/*; do {
	devpod_shims+=("${file##*/}")
}; done 2>/dev/null
make_shims "${devpod_shims[@]}"
