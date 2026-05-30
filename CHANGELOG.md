# Changelog

## Unreleased

- Remove the self-referential `apm` dependency (`matthewapeters/subutai`) to eliminate circular dependency resolution and orphaned local package installs.
- Add a selectable `subutai` orchestrator agent entrypoint so users can explicitly choose the Senior Engineering Delivery Manager role from Copilot agents.
- Change the default persona to Senior Engineering Delivery Manager and add a dedicated `tpm-expert` specialist for decomposition and sprint shaping.
- Add the `apm-expert` persona for APM package structure, release/versioning guidance, and packaging workflow decisions.
- Document the APM package semantic-versioning policy for major, minor, and patch changes.

## 0.0.1

- Initial project setup for customizing Copilot personas, skills, and prompts.
