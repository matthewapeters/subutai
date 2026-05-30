#!/usr/bin/env bash

set -euo pipefail

manifest_path="${1:-apm.yml}"

if [[ ! -f "$manifest_path" ]]; then
  echo "error: manifest not found: $manifest_path" >&2
  exit 2
fi

package_name="$(awk -F': *' '/^name:/ {print $2; exit}' "$manifest_path" | tr -d '"' | xargs)"

if [[ -z "$package_name" ]]; then
  echo "error: could not read package name from $manifest_path" >&2
  exit 2
fi

if grep -Eq "^[[:space:]]*-[[:space:]]*matthewapeters/${package_name}[[:space:]]*$" "$manifest_path"; then
  echo "error: circular dependency detected in $manifest_path" >&2
  echo "error: remove self-reference 'matthewapeters/${package_name}' from dependencies.apm" >&2
  exit 1
fi

echo "ok: no self-referential apm dependency in $manifest_path"
