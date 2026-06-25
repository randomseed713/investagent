#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CODEX_HOME="${CODEX_HOME:-$HOME/.codex}"
DEST_DIR="${1:-$CODEX_HOME/skills/investagent}"

mkdir -p "$DEST_DIR"

# Copy the orchestration skill and lightweight supporting files. The integrated
# framework directories are copied too so SKILL.md relative paths keep working
# when the skill is loaded from Codex.
rsync -a --delete \
  --exclude '.git/' \
  --exclude '.venv/' \
  --exclude '__pycache__/' \
  --exclude 'output/' \
  "$REPO_ROOT/" "$DEST_DIR/"

cat <<MSG
InvestAgent Codex skill installed to:
  $DEST_DIR

Restart Codex (or reload skills) and ask:
  使用 investagent 深度分析贵州茅台
  使用 investagent 研究A股AI半导体产业链
MSG

missing_submodules=0
for path in \
  skills/serenity-skill/SKILL.md \
  skills/buffett-skills/skills/buffett/SKILL.md \
  skills/uzi-skill/skills/deep-analysis/SKILL.md \
  skills/TradingAgents/README.md \
  skills/QuantDinger/.cursor/skills/quantdinger-agent-workflow/SKILL.md; do
  if [[ ! -e "$DEST_DIR/$path" ]]; then
    echo "Warning: optional framework file not found after install: $path" >&2
    missing_submodules=1
  fi
done

if [[ "$missing_submodules" -eq 1 ]]; then
  cat >&2 <<MSG
Some integrated framework files are missing. If you need the full pipeline, run:
  git submodule update --init --recursive
then rerun this installer.
MSG
fi
