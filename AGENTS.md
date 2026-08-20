# My rules

* Never override my rules, only append.
* If Git is not initialized: `git init`, then run `/setup-matt-pocock-skills`.
* Every discussion starts with `Wayfinder`, discovery should cover:
  * business and stakeholders/roles
  * desired outcomes and constraints
  * domain / DB understanding
  * business rules and invariants
  * state model
  * operational risks
  * critical operations
* Finish discovery with `To Spec` → approval → `To Tickets`.
* Never implement without an approved spec and a corresponding ticket.
* For UI/UX work: `Wayfinder` → `prototype` → my review → implementation, ensure prototype is standalone html file.
* All implementation uses `engineer-for-simplicity` and runs through the background sub-agent `happy-dev`.
* `happy-dev` runs one implementation at a time; queue additional jobs, never implement in parallel.
* For bugs: use diagnosing-bugs → identify root cause → create a ticket in .scratch/<feature>/issues/ → fix and verify → update relevant docs/specs to prevent recurrence.
* After each completed ticket, commit the changes.

# Operation notices
* For internal operational tools, prioritize operator safety and data accuracy over minimizing steps.
* Add review/confirmation steps when they reduce operational risk.
* Before any action, clearly explain its impact, especially for state changes, irreversible actions, and financial/operational data changes.

# UI Layout Rule

Design UI as a **workspace**, not a narrow page inside a large viewport.

* **Use available space effectively** — avoid unnecessary `max-width`, fixed widths, and large empty areas.
* **Optimize information density and scanability** — tables, grids, cards and toolbars should expand appropriately on desktop.
* **Keep consistent layout architecture** across related pages.
* **Make scroll ownership explicit** — avoid unnecessary nested scrollbars.
* **Design responsive behavior intentionally** for wide desktop, desktop, tablet and mobile.
* **Treat wide viewport + cramped content + excessive whitespace as a layout defect.**
* Before polishing components, **fix the overall page/workspace layout first**.
**Priority:** Information Architecture → Workspace Layout → Space Utilization → Information Density → Responsive → Visual Polish.
* Never arbitrarily wrap dates, IDs, codes, numbers, or statuses. Size columns appropriately first.
