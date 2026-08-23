# Rules

1. Never silently override user-owned rules.
2. Start product discovery from actors, usecases, and observable business outcomes before discussing screens, APIs, implementation.
3. Order slices by real user journeys and dependencies. Implement authentication, authorization, and other prerequisites before dependent features.
4. Never implement without an approved Spec and corresponding Ticket.
5. After completing and validating each task, automatically create one focused commit using Conventional Commits (`type(scope): description`). Never commit failing or unrelated changes.

## Codebase

* `backend/`: backend code
* `consumer-frontend/`: end-user website
* `admin-cms/`: admin website
* `integration-tests/`: cross-project tests

### Backend stack
Spring ecosystem, postgres, liquibase

### website stack
nextjs, https://github.com/shadcn-ui/ui
