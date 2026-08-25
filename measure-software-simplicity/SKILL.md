---
name: measure-software-simplicity
description: Evaluate a diff, component, service, or repository using measurable evidence. Metrics support judgment; they do not replace it.
---

## Rules

* Define scope and representative change scenarios before scoring.
* Cite evidence for every score.
* Use `Unknown` when evidence is insufficient; never guess.
* Use `N/A` only with a reason.
* Do not infer design quality from LOC or complexity alone.
* Do not modify code unless explicitly requested.
* Compare trends only within comparable scopes.
* For every assessed class/interface, record its purpose, owned responsibilities/invariants, and non-responsibilities as the responsibility baseline.
* On future assessments, compare implementation against this baseline; responsibility drift lowers the Single Responsibility score and requires human review.
* Never auto-update the responsibility baseline to match changed code.

## Workflow

### 1. Define scope

Record:

* assessment type: `diff | component | repository | before-after`
* included/excluded paths
* revision or time window
* intended behavior and constraints
* `1` scenario for a focused diff, otherwise `3–5` representative change scenarios

### 2. Collect evidence

Prefer:

1. contracts, schemas, tests, ADRs
2. source, interfaces, dependencies, call sites
3. commits, PRs, co-change history
4. incidents, benchmarks, runtime evidence
5. reviewer inference

Reference evidence as `path:line`, commit/PR, test, benchmark, or report.

### 3. Measure

| Principle                | Countable measures                                                                                          |
| ------------------------ | ----------------------------------------------------------------------------------------------------------- |
| Single Responsibility    | responsibility-baseline drift; independent change drivers; unrelated responsibilities; unrelated co-changes |
| Deep Modules             | public operations; exposed types; caller preconditions; exposed failure types; pass-through ratio           |
| Single Knowledge Owner   | duplicated rule implementations; files/modules changed per scenario                                         |
| Pull Complexity Downward | callers duplicating retry, mapping, ordering, formatting, recovery, or protocol logic                       |
| Valid States & Failures  | invalid construction paths; unenforced invariants; non-actionable failure categories                        |
| Names & Contracts        | conflicting terms; undocumented public contracts/invariants                                                 |
| Conventions & Scope      | convention deviations; unrelated changes; speculative abstractions without consumers                        |

Do not force irrelevant metrics.

### 4. Score

Score every applicable principle:

* `0 — Violated`: material design problem
* `1 — Weak`: works, but complexity/change cost is materially high
* `2 — Acceptable`: ownership and boundaries are clear enough
* `3 — Strong`: complexity is well hidden and changes remain localized

Responsibility drift cannot receive `3`; material unreviewed drift must score below `2`.

Confidence:

* `High`: code + test/history/runtime evidence
* `Medium`: direct code evidence
* `Low`: sampling or inference

Calculate:

```text
Overall = sum(scores) / numeric principles
Evidence coverage = numeric principles / applicable principles
```

Default gate when pass/fail is required:

* no score `0`
* Single Responsibility ≥ `2`
* Single Knowledge Owner ≥ `2`
* Valid States & Failures ≥ `2`
* no unresolved responsibility drift
* overall ≥ `2.2 / 3`
* evidence coverage ≥ `80%`

`Unknown` never passes a required gate.

## Recommendations

For each finding:

1. state the observed problem
2. cite evidence
3. explain system impact
4. recommend the smallest coherent change
5. define one observable validation criterion

Rank findings by:

1. failure risk
2. change amplification
3. cognitive load
4. remediation cost

## Required Output

```markdown
# Software Simplicity Assessment

## Summary
- Scope:
- Overall: X/3
- Evidence coverage: X%
- Gate: PASS | FAIL | Not requested

## Scorecard
| Principle | Score | Measured values | Evidence | Confidence | Finding |

## Scenario Results
| Scenario | Files changed | Modules changed | Duplicate rules | Caller burden |

## Findings
### [Priority] Finding
- Evidence:
- Impact:
- Recommendation:
- Validation:

## Limitations
- Missing evidence:
- Sampling:
- Residual uncertainty:
```

Never report a score without measured values and evidence beside it.
