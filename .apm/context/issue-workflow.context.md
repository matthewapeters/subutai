---
description: Structured issue lifecycle workflow for Subutai orchestration.
---
# Subutai Issue Workflow

Use this workflow when the user is handling a bug, regression, flaky behavior, production defect, support escalation, or tracked issue.

## Lifecycle pipeline

```text
issue-intake
    -> issue-reproduce-evidence
    -> issue-investigate
    -> issue-regression-tests
    -> issue-fix-close
    -> issue-pr-handoff
    -> issue-verify-release
```

Each phase is intentionally narrow. Do not skip phases silently. If a phase cannot complete, return the blocker, the missing evidence, and the exact next action.

## Operating rules

- Work one issue at a time unless the user explicitly wants batch triage.
- Prefer evidence, reproduction, and root-cause clarity before code changes.
- Keep issue-tracker updates and repository artifacts aligned so the audit trail is durable.
- The agent may say a fix is ready for UAT or ready for release verification, but should not claim a user-facing defect is fully resolved until the target environment or user confirms it.
- When the current project's primary languages are unclear and specialist routing depends on them, curate a durable language inventory under `.subutai/knowledge/` and record when it was last validated.

## Specialist routing by phase

| Phase | Typical owner | Common supporting specialists |
| --- | --- | --- |
| `issue-intake` | Orchestrator | Application Architect, Frontend Engineer, SRE |
| `issue-reproduce-evidence` | Orchestrator | Linux Automation Expert, Frontend Engineer, SRE |
| `issue-investigate` | Orchestrator | Application Architect, language specialist, Security Architect |
| `issue-regression-tests` | SDET | language specialist, Frontend Engineer |
| `issue-fix-close` | Orchestrator | language specialist, Security Architect, SDET |
| `issue-pr-handoff` | CI/CD Expert | Orchestrator |
| `issue-verify-release` | Orchestrator | SRE, Frontend Engineer, Linux Automation Expert |

## Platform notes

### GitHub.com Projects

- Use GitHub issues and pull requests as the system of record.
- Preserve labels, linked issues, PR references, release/build evidence, and reopen criteria in issue comments or structured issue sections.

### Atlassian Projects

- Use Jira issues for lifecycle state and Bitbucket pull requests for code-review linkage.
- Preserve ticket transitions, linked pull requests, release/build evidence, and reopen criteria in Jira comments or ticket fields.
