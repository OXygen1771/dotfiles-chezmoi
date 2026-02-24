$apps_winget = @("Starship.Starship", "Neovim.Neovim", "GitHub.GitLFS")
foreach ($app_id in $apps_winget)
{
    winget install --id $app_id -e -i --accept-source-agreements --accept-package-agreements
}

# Install uv
powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"
