# SKa AI docker storage

This repo contains Docker files and agent rules for running agents like Claude Code and DeepSeek Harness within a Docker container.

Major benefits on running the agents in their own containers: They won't modify your system! All the build environments are isolated to their own containers and won't clash between each other nor your own system!

## Initial run (to create the container)
docker run -it --name container-name -v "./PROJECT_FOLDER:/workspace" -v "./AGENTS-PROJECT-BASE.md:/etc/.claude/CLAUDE.md:ro" -v "./AGENTS-GLOBAL.md:/home/node/.claude/CLAUDE.md:ro" -v claude-config:/home/node/.claude image-name

## Later:
docker start -ai container-name

## DSH versions:
docker run -it --name container-name -e DEEPSEEK_API_KEY="your-api-key" -v "./PROJECT_FOLDER:/workspace" -v "./AGENTS-PROJECT-COMBINED.md:/home/dshuser/.dsh/AGENTS.md:ro" -v dsh-data:/home/dsh-user/.dsh image-name
