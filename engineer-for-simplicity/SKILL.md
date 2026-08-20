---
name: engineer-for-simplicity
description: Design, implement, refactor, debug, optimize, and review software with low long-term complexity and Single Responsibility as a core constraint. Use for architecture, API/module design, feature work, code changes, reviews, error design, or performance work. For implementation tasks, require a main model/interface skeleton with inputs and outputs plus a show-me diagram, then wait for explicit approval before changing code.
---

# Engineer for Simplicity

Build correct software that future developers can understand and change safely. Optimize the whole system, not local cleverness or the fewest changed lines.

## Core rules

- Enforce **Single Responsibility** at component, module, class, and function level: own one cohesive policy, body of knowledge, or set of invariants with one primary reason to change. Split independent change drivers; keep state and operations together when they protect the same invariants. SRP does not mean one method per class.
- Prefer **deep modules**: small, clear interfaces with substantial capability behind them. Avoid classitis, pass-through layers, thin wrappers, and abstractions that only relocate complexity.
- Keep each design fact owned in one place. Hide storage, protocol, ordering, retry, formatting, and recovery details whenever callers need not know them.
- Design material boundaries at least twice. Compare responsibility cohesion, interface size, dependencies, change amplification, cognitive load, testability, failure containment, compatibility, and measured performance.
- Pull complexity downward when handling it once simplifies many callers. Keep lower layers general-purpose and special-purpose policy higher.
- Design invalid states and needless special cases out of existence. Mask or aggregate failures callers cannot act on; expose actionable failures; fail fast on broken invariants.
- Use precise, consistent names. Document contracts, intent, invariants, and non-obvious reasons—not syntax.
- Preserve established conventions unless a deliberate change clearly reduces system-wide complexity. Improve touched code proportionately; avoid speculative frameworks and unrelated rewrites.
- Measure before performance optimization and verify after it.

## Workflow

### 1. Establish truth

Read repository instructions, nearby code, tests, contracts, schemas, and runtime constraints. State required behavior, non-goals, compatibility boundaries, assumptions, and observable behavior that must remain unchanged.

### 2. Diagnose and design

Map:

- **Change amplification:** how many places change for one behavior change?
- **Cognitive load:** what must a developer remember?
- **Unknown unknowns:** can all affected behavior and knowledge be found reliably?

Trace knowledge ownership, not merely execution order. Sketch at least two credible designs for material decisions and select the simpler system-wide option.

### 3. Mandatory approval gate before implementation

Before editing implementation code, create an approval proposal containing:

1. **Design choice:** selected design, one credible alternative, and the decisive trade-off.
2. **Skeleton:** main models and interfaces only, with no method bodies. For each, show:
   - kind and name;
   - single responsibility;
   - input types and relevant fields;
   - output type and meaning;
   - important invariants and caller-actionable failures;
   - essential dependencies.
3. **Diagram:** invoke `$show-me` and draw the smallest useful visual that matches the skeleton. Prefer a concise Mermaid class/component diagram for ownership and relationships or a sequence/data-flow diagram for runtime behavior. Include only main boundaries, inputs, outputs, and calls.
4. **Approval request:** explicitly ask the user to approve or revise the skeleton and diagram.

Stop and wait. Do not implement source changes, migrations, or generated code until the user explicitly approves. If feedback changes a boundary, revise the skeleton and diagram and request approval again. Skip this gate only when the user explicitly waives it.

### 4. Implement the approved design

Implement the smallest coherent change that conforms to the approved skeleton. Keep behavior changes separate from unrelated cleanup where practical. If implementation evidence requires a material boundary or contract change, stop, update the proposal, and request approval again.

### 5. Verify

Test changed behavior, boundary cases, failures, and recovery. Run the smallest relevant checks, then the broader safe suite required by the repository. Inspect the final diff for mixed responsibilities, stale documentation, duplicated knowledge, naming drift, accidental scope, and pass-through layers. When Maven or Gradle output is long, summarize with:

```bash
grep -E "FAILURE|ERROR|Tests run:|Caused by:|AssertionError"
```

Report the outcome, conformance to the approved design, exact validation run, and residual risks. Never claim success without validation evidence.

Source principles: John Ousterhout's *A Philosophy of Software Design*, summarized in <https://github.com/alysivji/notes/blob/main/software-engineering/philosophy_of_software_design.md>.
