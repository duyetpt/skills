---
name: engineer-for-simplicity
description: Design, implement, refactor, debug, optimize, and review backend code.
---

## Engineering principles

* Enforce Single Responsibility at component, module, class, and function levels. Each unit should own one cohesive policy, body of knowledge, or set of invariants.
* Prefer deep modules with small interfaces and substantial capability.
* Avoid unnecessary layers, thin wrappers, pass-through delegation, and speculative abstractions.
* Assign every design fact, business rule, and invariant to one authoritative owner.
* Hide storage, protocol, retry, ordering, formatting, and recovery details from callers that do not need them.
* Pull reusable mechanical complexity downward while keeping business policy in higher-level domain code.
* Eliminate invalid states and unnecessary special cases by design.
* Fail fast when invariants are broken and expose only actionable failures.
* Use precise names and document contracts, intent, invariants, and non-obvious decisions.
* Preserve established conventions unless changing them clearly reduces overall complexity.

## Implement

- Make the smallest coherent change, prefer framework or system capacities, solutions first before custome.
- prefer simple mvc model and patterns.
- separate package for specific functions as scheduled jobs.
- always use Liquibase with sql for db migrations.

# Verify

- Pass test for specific change.
- Pass test for whole project.

Evaluate the final design and code with `$measure-software-simplicity`. Cite evidence for every score and enforce this gate:

* Every applicable principle must score at least `2`.
* Single Responsibility must score `3`.
* Every `N/A` must include a reason.
* `Unknown` does not pass the gate.

If the task authorizes changes and any gate fails, fix the findings within the approved scope, rerun validation, and reassess.
