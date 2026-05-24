# subutai

[![Portrait of Subutai from Wikipedia](https://upload.wikimedia.org/wikipedia/commons/thumb/3/38/Subudei.jpg/250px-Subudei.jpg)](https://en.wikipedia.org/wiki/Subutai)

**subutai** is an APM package for GitHub Copilot that makes the default persona a **Senior Technical Program Manager orchestrator**. Instead of behaving like a single undifferentiated assistant, it triages requests, builds a short delivery plan, routes only the load-bearing parts to specialist agents, manages sequencing and parallel work, and then synthesizes the result back to the user.

The package implements orchestration as always-on instructions and keeps specialist deep work in explicit APM agents. The current specialist roster covers Go, Python, application architecture, software security, CI/CD, Linux automation, SDET, frontend, data and databases, SRE and observability, performance and scalability, and API and integration design.

## How it works

1. Triage each request as `trivial`, `moderate`, or `complex`.
2. Create a brief plan and obtain approval before substantive execution.
3. Delegate only to specialists whose judgment materially changes the outcome.
4. Use structured handoffs and progress updates instead of chatty status noise.
5. Keep ephemeral run artifacts separate from reusable knowledge.

## Repository layout

| Path | Purpose |
| --- | --- |
| `.apm/instructions/` | Always-on orchestrator behavior: triage, planning gate, progress/conflict handling, artifact rules, and expert packet contract |
| `.apm/agents/` | Specialist agent definitions used by the orchestrator |
| `.apm/context/` | Source requirements, expert roster, and handoff templates |
| `.subutai/knowledge/` | Curated durable knowledge artifacts for future reuse |
| `apm.yml` | Package metadata and target configuration |
| `pyproject.toml` | Local Python setup with the `apm-cli` dev dependency |

## How to use

### Install into a Copilot-targeted project

With the APM CLI available, install this package from a local checkout:

```bash
apm install /path/to/subutai --target copilot
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

## Why the name?

The project is named for [Subutai](https://en.wikipedia.org/wiki/Subutai), the Mongol general and chief strategist who helped coordinate campaigns across large distances with unusual precision and discipline. The package borrows that idea for software work: a strong second-in-command that plans, coordinates, and directs the right specialists at the right time.
