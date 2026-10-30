# AI Assistant Rules

## Git & Version Control
- **NEVER** run `git push` or any remote related commands.
- You may freely run git commands without connections to remotes (`git status`, `git diff`, `git log`, `git add`, `git commit` etc.)
- Aim to keep each commit to one logical change that a reviewer can understand in a few minutes. Split refactors, formatting, and behavior changes into separate commits.
- Run `git commit` at the end of a work package with short explanaion on what was changed.

## General manners
- Verify before finishing. Run the relevant tests, linter, and build before a work package is considered done, and report what was run and what passed or failed.
- Add or update tests when behavior changes. In case a test update is about an API, report what API it touches and what risks are there for the legacy case.
- When a library or API version matters, check the version in the lockfile or manifest and the docs or source for that version before writing code against it.
- Do not assume a function, file, config key, or endpoint exists. Search for it or read it first.
- Maintain a `docs/agent-project-context.md` (or similar) with architecture decisions, conventions, and known gotchas. Read it at the start of each work package and update it when you learn something that future work will need.
