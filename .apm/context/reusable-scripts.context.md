---
description: Policy and registry contract for reusable helper scripts created during orchestration.
---
# Reusable Helper Scripts

When the agent creates helper scripts to facilitate its own work, treat recurring or general-purpose scripts as candidates for durable reuse rather than disposable one-offs.

## Promotion rule

Promote a script into a reusable artifact when all of the following are true:

- the script solves a problem likely to recur across prompts or repositories
- the behavior is stable enough to document
- the script can be invoked with clear inputs and outputs
- reuse is more efficient or reliable than re-creating the script from scratch

Keep truly task-specific throwaway scripts out of the durable registry.

## Storage and documentation

- Store reusable helper scripts under `.subutai/tools/`.
- Give each script a meaningful, capability-oriented name.
- Add clear docstrings or file-header documentation for future agent use.
- Prefer implementations that are reliable in automation contexts, especially when shell quoting or multiline content generation is error-prone.

## Registry contract

Whenever a reusable helper script is added or materially changed, update `.subutai/knowledge/reusable-script-registry.md` with:

- script path
- purpose
- when to use it
- inputs
- outputs
- language/runtime
- last validated notes

The registry is an enhancement to the configured toolset, not a replacement for built-in tools.
