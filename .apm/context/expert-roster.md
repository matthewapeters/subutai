# Subutai Expert Roster

This file is the canonical roster of expert personas available to the Subutai orchestrator. The orchestrator should use this list directly rather than rediscovering available specialists during planning.

## Core operating rule

- Route only to the experts whose judgment materially changes the plan, execution, or risk profile.
- Do not consult every expert by default.
- Prefer concise handoffs using `.apm/context/specialist-handoff-template.md`.

## Available experts

| Expert | Use when | Primary outputs |
| --- | --- | --- |
| Go Staff Programmer | Go implementation, concurrency, package design, service code, tests, refactors | Go implementation plan, code guidance, review findings |
| Python Staff Programmer | Python implementation, tooling, automation, typing, packaging, tests | Python implementation plan, code guidance, review findings |
| Senior Application Architect | Multi-component design, service boundaries, delivery decomposition, architecture trade-offs | Architecture decisions, sequencing guidance, dependency map |
| Senior Software Security Architect | Threat modeling, auth, secrets, trust boundaries, hardening, secure design | Security findings, risk decisions, mitigation plan |
| Senior CI/CD Engineer | Pipelines, release flows, build systems, artifact publication, deployment safety | Pipeline plan, release checks, deployment recommendations |
| Senior Linux Automation Engineer | Bash, CLI automation, tmux workflows, environment scripting, system-level setup | Scripts, shell workflow guidance, automation plan |
| Senior APM Package Expert | APM package structure, primitive layout, compile/install behavior, release versioning, packaging, marketplace/distribution | Package design decisions, versioning guidance, release workflow recommendations |
| Senior SDET | Test strategy, automation coverage, test harnesses, end-to-end quality, regression control | Test plan, coverage gaps, quality risks |
| Senior Frontend Engineer | UI architecture, component design, accessibility, browser behavior | Frontend plan, UX risks, implementation guidance |
| Senior Data and Database Architect | Schema design, queries, migrations, storage trade-offs, data integrity | Data model decisions, migration plan, persistence risks |
| Senior Site Reliability and Observability Engineer | Monitoring, alerting, resilience, production diagnostics, operability | Reliability plan, observability checklist, operational risks |
| Senior Performance and Scalability Engineer | Profiling, latency, throughput, concurrency, capacity planning | Performance plan, bottleneck analysis, scaling risks |
| Senior API and Integration Architect | API contracts, backward compatibility, external integrations, interface boundaries | Contract decisions, integration plan, compatibility risks |

## Routing heuristics

- Start with the smallest set of experts that can confidently shape the plan.
- Add architecture review for cross-cutting or multi-service work.
- Add security review when the task affects inputs, trust boundaries, credentials, auth, network access, data protection, or externally reachable surfaces.
- Add the APM expert for package-authoring, release/versioning policy, compile/install behavior, or target-output contract questions.
- Add SDET for changes that alter user flows, integrations, complex business logic, or regression-sensitive behavior.
- Add CI/CD or Linux automation when delivery depends on pipelines, scripts, environment setup, local tooling, or operational automation.
- Add Linux automation and SDET together for tmux or terminal UX work when layout or operator flow needs headless validation rather than manual inspection alone.
- Add data, API, performance, frontend, or SRE specialists only when their specialty is load-bearing for the requested outcome.
