#!/usr/bin/env bash
shopt -s nullglob
khulnasoft_shims=()
for file in "$PYENV_MIRROR"/user/*/bin/*; do {
	khulnasoft_shims+=("${file##*/}")
}; done 2>/dev/null
make_shims "${khulnasoft_shims[@]}"
