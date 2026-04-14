param(
  [string]$RepoPathWsl = "/mnt/d/Donggri_Platform/Automethemoney",
  [string]$Branch = "main",
  [string]$Schedule = "*/30 * * * *"
)

$publishScript = "$RepoPathWsl/ops/publish-pages.sh"
$installScript = "$RepoPathWsl/ops/install-pages-cron.sh"

wsl bash -lc "chmod +x '$publishScript' '$installScript'"
wsl bash -lc "'$installScript' '$publishScript' '$RepoPathWsl' '$Branch' '$Schedule'"
