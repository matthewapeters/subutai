# subutai

[![Portrait of Subutai from Wikipedia](https://upload.wikimedia.org/wikipedia/commons/thumb/3/38/Subudei.jpg/250px-Subudei.jpg)](https://en.wikipedia.org/wiki/Subutai)

**subutai** is an APM package for GitHub Copilot that makes the default persona a **Senior Engineering Delivery Manager orchestrator**. Instead of behaving like a single undifferentiated assistant, it triages requests, drives work toward user-observable value, routes only the load-bearing parts to specialist agents, manages sequencing and parallel work, and then synthesizes the result back to the user.

The package implements orchestration as always-on instructions and keeps specialist deep work in explicit APM agents. The current specialist roster covers Go, Python, application architecture, software security, CI/CD, Linux automation, Senior Technical Program Management, APM package design and versioning, SDET, frontend, data and databases, SRE and observability, performance and scalability, API and integration design, plus a staged issue-workflow pack for tracked defect handling and a reusable-helper-script pattern for recurring automation tasks.

Repository URLs:

- https://github.com/matthewapeters/subutai
- git@github.com:matthewapeters/subutai.git

## How it works

1. Triage each request as `trivial`, `moderate`, or `complex`.
2. Deliver the smallest slice that produces user-observable value.
3. Use the TPM expert to evaluate ambiguous prompts and decompose complex problems when better planning materially improves delivery.
4. Delegate only to specialists whose judgment materially changes the outcome.
5. Use structured handoffs and progress updates instead of chatty status noise.
6. Keep ephemeral run artifacts separate from reusable knowledge.

Sprint closeout expectations:

1. All relevant quality gates pass.
2. All code and directly related documentation are committed.
3. The thematic features of the sprint are demonstrated.
4. The thematic features planned for the next sprint are presented.

For bug and issue work, Subutai now includes a dedicated lifecycle:

1. `issue-intake`
2. `issue-reproduce-evidence`
3. `issue-investigate`
4. `issue-regression-tests`
5. `issue-fix-close`
6. `issue-pr-handoff`
7. `issue-verify-release`

## Repository layout

| Path | Purpose |
| --- | --- |
| `.apm/instructions/` | Always-on orchestrator behavior: triage, planning gate, progress/conflict handling, artifact rules, and expert packet contract |
| `.apm/agents/` | Specialist agent definitions and issue-workflow chatmodes used by the orchestrator |
| `.apm/context/` | Source requirements, expert roster, handoff templates, issue-workflow routing guidance, and reusable-script policy |
| `.subutai/knowledge/` | Curated durable knowledge artifacts such as issue or language guidance and the reusable-script registry |
| `.subutai/tools/` | Reusable helper scripts promoted from recurring agent-authored automation |
| `apm.yml` | Package metadata and target configuration |
| `pyproject.toml` | Local Python setup with the `apm-cli` dev dependency |

## How to use

### Install into a Copilot-targeted project

With the APM CLI available, install this package from GitHub:

```bash
apm install matthewapeters/subutai --target copilot
```

If you want a local checkout first:

```bash
git clone git@github.com:matthewapeters/subutai.git
cd subutai
apm install . --target copilot
```

### Develop or validate this package locally

Validate the APM primitives:

```bash
./.venv/bin/apm compile --validate --target copilot
```

Preview the generated Copilot artifacts without writing files:

```bash
./.venv/bin/apm compile --dry-run --target copilot
```

Generate the Copilot-targeted outputs when ready:

```bash
./.venv/bin/apm compile --target copilot
```

### Release or test this package

For a normal GitHub-hosted APM package like Subutai, the practical release unit is a
**git ref**. There is no top-level `apm publish` command for this workflow.

The usual flow is:

1. Update the package source under `.apm/`.
2. If you are tracking package versions, bump `version:` in `apm.yml` and update `CHANGELOG.md`.
3. Regenerate any compiled artifacts you want to ship:

   ```bash
   ./.venv/bin/apm compile --validate --target copilot
   ./.venv/bin/apm compile --target copilot
   ```

4. Commit the source changes plus generated artifacts such as `AGENTS.md` and `.github/copilot-instructions.md`.
5. Create and push a tag for the release you want consumers to test:

   ```bash
   git tag v0.0.1-test.1
   git push origin v0.0.1-test.1
   ```

Consumers can then install that exact release candidate by ref:

```bash
apm install matthewapeters/subutai#v0.0.1-test.1 --target copilot
```

You can also point APM at a branch while iterating:

```bash
apm install matthewapeters/subutai#main --target copilot
```

To see which remote refs are currently available:

```bash
apm view matthewapeters/subutai versions
```

If you want a packaged artifact instead of a GitHub ref, build one with:

```bash
./.venv/bin/apm pack
```

`apm marketplace publish` is a separate workflow for repositories that maintain a
configured `marketplace:` block in `apm.yml`; it is not required just to ship a new
Git tag of this package for testing.

### Semantic versioning for an APM package

Subutai now includes an `apm-expert` persona for package-authoring and release-policy
questions. The versioning contract it should apply is:

| Version | Use when | Examples in an APM package |
| --- | --- | --- |
| **Major** | The consumer-facing package contract changes incompatibly | Rename or remove specialist entrypoints, change staged workflow phases, break install layout, or substantially change default delivery-manager behavior |
| **Minor** | You add backward-compatible capability | Add a new expert persona, add a new workflow, add a new target, or expand orchestration behavior compatibly |
| **Patch** | You make backward-compatible fixes or clarifications | Refine instructions, fix routing or generated outputs, tighten wording, or update docs without changing the advertised package contract |

For Subutai specifically, treat the public contract as the default orchestrator
behavior, named expert/workflow entrypoints, staged issue lifecycle, and generated
target outputs that consumers install and rely on.

### Use the issue workflow

Subutai’s issue lifecycle is packaged as explicit agent/chatmode entrypoints under `.apm/agents/`. Use them when the user is working a bug, regression, flaky failure, or tracked issue rather than improvising a one-off sequence.

The workflow is designed to move in order:

```text
issue-intake
  -> issue-reproduce-evidence
  -> issue-investigate
  -> issue-regression-tests
  -> issue-fix-close
  -> issue-pr-handoff
  -> issue-verify-release
```

The orchestrator should keep ownership of sequencing and approvals, and involve the relevant specialists at each phase. The included workflow guidance covers both **GitHub.com Projects** and **Atlassian Projects** so the same flow can drive GitHub Issues and PRs or Jira and Bitbucket handoffs.

### Use reusable helper scripts

When Subutai has to create automation for its own work, it should treat recurring script patterns as reusable assets instead of re-creating them repeatedly.

- Store reusable scripts under `.subutai/tools/`
- Document them with clear names and useful docstrings
- Register them in `.subutai/knowledge/reusable-script-registry.md`
- Prefer the registry before inventing a new general-purpose helper

This is especially useful for reliability-oriented automation such as multiline file generation, quoting-safe content emission, or other cases where brittle shell one-liners tend to fail.

## Why the name?

The project is named for [Subutai](https://en.wikipedia.org/wiki/Subutai), the Mongol general and chief strategist who helped coordinate campaigns across large distances with unusual precision and discipline. The package borrows that idea for software work: a strong second-in-command that plans, coordinates, and directs the right specialists at the right time.
