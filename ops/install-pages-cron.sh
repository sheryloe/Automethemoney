#!/usr/bin/env bash
set -euo pipefail

SCRIPT_PATH="${1:-/mnt/d/Donggri_Platform/Automethemoney/ops/publish-pages.sh}"
REPO_DIR="${2:-/mnt/d/Donggri_Platform/Automethemoney}"
BRANCH="${3:-main}"
SCHEDULE="${4:-*/30 * * * *}"
LOG_PATH="/tmp/automethemoney-pages-cron.log"

LINE="$SCHEDULE $SCRIPT_PATH $REPO_DIR $BRANCH >> $LOG_PATH 2>&1"

( crontab -l 2>/dev/null | grep -v 'publish-pages.sh' || true; echo "$LINE" ) | crontab -

echo "[ok] cron 등록 완료"
crontab -l
