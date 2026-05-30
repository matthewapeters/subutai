# Reusable Script Registry

This registry tracks curated helper scripts that Subutai agents should consider before re-creating ad hoc automation.

## How to use this registry

- Check this file before writing a new general-purpose helper script.
- Prefer an existing registered script when it already matches the task.
- When adding a new reusable script, place it under `.subutai/tools/` and add or update an entry here in the same change.
- Do not register one-off throwaway scripts created for a single transient task.

## Registered scripts

### `check-self-apm-dependency`

- **Path:** `.subutai/tools/check-self-apm-dependency.sh`
- **Purpose:** Detects a circular package dependency where `apm.yml` references `matthewapeters/<current-package-name>` inside `dependencies.apm`.
- **Use when:** Validating package metadata in CI, pre-release checks, or after dependency edits.
- **Inputs:** Optional path argument to an APM manifest; defaults to `apm.yml`.
- **Outputs:** Writes a pass/fail status message; exits `0` on pass, `1` on detected cycle, `2` on invalid input.
- **Language/runtime:** Bash.
- **Last validated:** 2026-05-30 via local script execution and GitHub Actions workflow wiring.

## Entry template

### `<script-name>`

- **Path:** `.subutai/tools/<script-name>.py`
- **Purpose:** What the script does.
- **Use when:** Situations where agents should prefer this over re-creating an ad hoc script.
- **Inputs:** Expected arguments, files, stdin, or environment variables.
- **Outputs:** Files created, stdout/stderr behavior, exit codes, or side effects.
- **Language/runtime:** Example: Python 3.12, Bash, Go.
- **Last validated:** YYYY-MM-DD and brief validation notes.
