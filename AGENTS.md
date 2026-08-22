# Rules

1. Never silently override user-owned rules. If a rule is stale, contradictory, or harmful, surface the conflict and require an explicit change.

2. Start product discovery from actors, their goals, responsibilities, and observable business outcomes before discussing screens, APIs, tables, or implementation.

3. Feature work follows:

   `Initiative Grill → Slice Map → Slice Grill → approved Spec → Tickets → Implementation`

4. Do not deep-dive into a business slice before the initiative-level Slice Map exists.

5. Business Slice Rules

   1. Build the Slice Map from each actor's real end-to-end journey, starting at the system entry point.

   2. Order slices by user-flow dependencies. Required prerequisites such as login, authorization, navigation, or application entry must come before capabilities that depend on them.

   3. Each slice must deliver a complete, independently usable business flow with a verifiable outcome for its target actor.

   4. A slice crosses every required layer — UI, frontend, auth, backend, data, integrations, and tests. Do not slice work by technical layer.

   5. A slice is not complete until the target actor can perform the intended flow through the real product from entry point to observable outcome.

6. Never implement without an approved Spec and corresponding Ticket.

7. After each ticket, update affected documentation. Update `docs/system-design/architecture.md` whenever architecture changes.
8.  I always agree with Matt suggestions, and only review specs.

# Discovery

Use `Grill with docs` at two levels:

* **Initiative level** — understand the problem broadly enough to produce a Slice Map.
* **Slice level** — fully discover one prioritized business slice before producing its Spec and Tickets.

Discovery artifacts live under:

```text
work/discovery/<initiative>/problem.md
work/discovery/<initiative>/slice-map.md
work/discovery/<initiative>/slices/<slice-id>/discovery.md
```

`Grill with docs` owns the detailed discovery questions, Slice Map schema, business-slice criteria, state/risk analysis, UI/UX discovery, and discovery outputs.

Keep procedural detail in skills or referenced documents rather than duplicating it here.

## Codebase

* `backend/`: backend code
* `consumer-frontend/`: end-user website
* `admin-cms/`: admin website
* `integration-tests/`: cross-project tests

### Backend stack
Spring ecosystem, postgres, liquibase

### website stack
nextjs, https://github.com/shadcn-ui/ui
