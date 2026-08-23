---
name: engineer-for-simplicity
description: Design, implement, refactor, debug, optimize, and review backend code.
---

## Engineering principles

* Enforce Single Responsibility and assign every rule, invariant, and design decision to one authoritative owner.
* Prefer deep modules with small interfaces, meaningful capability, and hidden implementation complexity.
* Avoid unnecessary layers, pass-through delegation, thin wrappers, speculative abstractions, and invalid states.
* Keep reusable mechanics in lower layers, domain policies in higher layers, and expose only actionable failures.
* Use precise names, document non-obvious contracts and decisions, and preserve conventions unless change clearly reduces overall complexity.

## Implement

- Make the smallest coherent change, prefer framework capabilities over custom solutions, and use simple MVC patterns.
- Separate package for specific functions as scheduled jobs.
- Always use Liquibase with sql for db migrations.
- Use an `exposeErrorDetails` flag to control error responses. If enabled, return the specific error code, operation, and field; otherwise return a generic security-safe error. Always propagate trace context and correlation ID across services, log diagnostics internally, and disable error details by default in production.

# Verify

Pass tests for both the specific change and the whole project. Evaluate the final design and code with `$measure-software-simplicity`, citing every score; require all applicable principles ≥2, Single Responsibility =3, justified `N/A`, and no `Unknown`. If authorized changes fail the gate, fix them within scope, rerun validation, and reassess.
