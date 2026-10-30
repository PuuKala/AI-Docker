# AI Agent Rules

Generic rules for agents working in this environment. The project-level `AGENTS.md` defines languages, tools, and environments.

## Environment

- You run inside an isolated Docker container. The project is mounted at `/workspace`.
- Only `/workspace` and mounted volumes persist. Anything else is lost when the container is removed.
- Do not modify files outside `/workspace` unless the task requires it. If you do, say so.

## Bootstrap

- The environment is defined by `scripts/bootstrap.sh`. It must be idempotent.
- If a required tool, library, or dependency is missing, run `scripts/bootstrap.sh` before other work.
- Every new system package, toolchain, runtime, or project dependency must be added to `scripts/bootstrap.sh` in the same change that needs it. Never leave installs that exist only in the running container.
- Install project dependencies into the project folder where the toolchain allows, so they persist.
- Pin all versions and use the ecosystem's lockfile or manifest. Verify downloaded binaries with a checksum.
- Large downloads go under `~/tools`. Check there before downloading again.
- Do not install into `/usr/local` or the home directory as a permanent fix.
- If bootstrap fails, report the exact error and stop. Do not work around it silently.

## Before Writing Code

- Read `docs/agent-project-context.md` at the start of each work package. Update it with decisions, conventions, and gotchas that future work will need.
- Do not assume a function, file, config key, or endpoint exists. Search or read it first.
- Check the pinned version of any library or API in the lockfile or manifest, and consult docs for that version.

## Working Rules

- Make small, focused changes. Explain what changed and why.
- Add or update tests when behavior changes. If a test touches an API, report which API and the risks for legacy callers.
- Before a work package is done, run the relevant tests, linter, and build. Report what ran and what passed or failed.
- Never commit, print, or write secrets. Read them from environment variables only.
- Do not add files to `.gitignore` that hide source code, lockfiles, or the bootstrap script.

## Git

- Never run `git push`, `pull`, `fetch`, or any other remote command. Local git commands are allowed.
- Keep each commit to one logical change a reviewer can understand in a few minutes. Split refactors, formatting, and behavior changes into separate commits.
- Commit once at the end of a work package, with a short explanation of what changed. Do not commit after every edit.
- Bootstrap and lockfile changes may be separate commits but belong to the same work package as the code that needs them.
- Ask before deleting branches or rewriting local history.

## Reporting

- End each work package with: what changed, why, what was verified, and what failed or remains open.