# In-container manners

## Context
- Read `docs/agent-project-context.md` at the start of each work package and update it with decisions, conventions, and gotchas.
- Before writing code against a library or API, check the pinned version in the lockfile or manifest and the docs for that version.

## Environment

- This project runs inside a Docker container. The project folder is mounted at `/workspace`.
- The container image is defined by the `Dockerfile` in the repo root. It is a Debian-based image with Node.js, git, and common build tools. Do not assume a specific version: check the `Dockerfile` for the base image tag, and verify with `cat /etc/os-release` and `<tool> --version` when a version matters.
- The image is generic. Project-specific toolchains and dependencies belong to this repo's bootstrap script, not to the image.
- Files outside `/workspace` and outside mounted volumes are lost when the container is removed.

## Bootstrap

- The environment is defined by `scripts/bootstrap.sh`. It must be idempotent and safe to run repeatedly.
- If a required tool, library, or project dependency is missing, run `scripts/bootstrap.sh` before doing other work.
- Any new system package, toolchain, language runtime, or project dependency must be added to `scripts/bootstrap.sh` in the same change that needs it. Do not leave installs that exist only in the running container.
- Install project dependencies into the project folder where the toolchain allows it (for example `.venv/`, `node_modules/`, a local `build/` or vendor directory), so they persist.
- Pin versions for everything the project depends on: toolchains, engines, SDKs, and libraries. Use the ecosystem's lockfile or manifest, and verify downloaded binaries with a checksum.
- If the bootstrap fails, report the exact error and stop. Do not work around it silently.

## Tools and Caches

- Large downloads (engines, SDKs, toolchains, export templates) go under `~/tools`. Check there before downloading again.
- Do not install anything into `/usr/local` or the home directory as a permanent fix.

## Working Rules

- Make small, focused changes and explain what you changed and why.
- Before a work package is done, run the relevant tests, linter, and build, and report what ran and what passed or failed.
- Do not modify files outside `~/project` unless the task requires it, and say so when you do.
- Never commit, print, or write secrets (API keys, tokens). Read them from environment variables only.
- Do not add files to `.gitignore` that hide source code, lockfiles, or the bootstrap script.

## Git

- Follow the user-level git rules. Claude does not run push, pull, fetch, or any other remote command.
- Keep each commit to one logical change. Commit at the end of a work package, not after every edit.
- Bootstrap, Dockerfile, and lockfile changes may be separate commits, but belong to the same work package as the code that needs them.
- Ask before deleting branches or rewriting local history.
