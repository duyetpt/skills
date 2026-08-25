# Rules

1. Never silently override user-owned rules.
2. Start product discovery from actors, usecases, and observable business outcomes before discussing screens, APIs, implementation.
3. Never implement without an approved Spec and corresponding Ticket.
4. After completing and validating each task, automatically create one focused commit using Conventional Commits (`type(scope): description`). Never commit failing or unrelated changes.
5. End users are not developer, please make tool(frontend) for them.

Any unanswered prerequisite or dependency on a later slice fails the plan.

### Backend
- Spring ecosystem, postgres, liquibase, thymeleaf, tailwindcss, htmx.
- - Make the smallest coherent change, prefer framework capabilities over custom solutions.
- Use an `exposeErrorDetails` flag to control error responses. If enabled, return the specific error code, operation, and field; otherwise return a generic security-safe error. Always propagate trace context and correlation ID across services, log diagnostics internally, and disable error details by default in production.
- Every API must maintain a version-controlled contract: REST → OpenAPI, GraphQL → SDL; contract drift fails validation.
