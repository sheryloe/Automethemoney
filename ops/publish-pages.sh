#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="${1:-/mnt/d/Donggri_Platform/Automethemoney}"
BRANCH="${2:-main}"

cd "$REPO_DIR"

git fetch origin "$BRANCH"
git checkout "$BRANCH"
git pull --ff-only origin "$BRANCH"

if git diff --quiet -- docs; then
  echo "[skip] docs 변경 없음"
  exit 0
fi

git add docs
git commit -m "chore(pages): brochure update $(date +'%Y-%m-%d %H:%M:%S')"
git push origin "$BRANCH"

echo "[ok] docs 배포 완료"
