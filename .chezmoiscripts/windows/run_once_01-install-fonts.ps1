$fonts = @(
    "JetBrainsMono",
    "NerdFontsSymbolsOnlyMono"
)

if (!(Get-Module -ListAvailable -Name NerdFonts))
{
    Write-Host "NerdFonts PowerShell module needed to install fonts. Trying to install..." -ForegroundColor Cyan
    
    if (!(Get-Command Install-PSResource -ErrorAction SilentlyContinue))
    {
        Install-Module -Name Microsoft.PowerShell.PSResourceGet -Force -Scope CurrentUser
    }
    Install-PSResource -Name NerdFonts
    Write-Host "NerdFonts module installed!" -ForegroundColor Green
}

Import-Module -Name NerdFonts

$installedFonts = (New-Object System.Drawing.Text.InstalledFontCollection).Families.Name

foreach ($font in $fonts)
{
    if ($installedFonts -contains $font -or $installedFonts -replace '\s', '' -contains $font)
    {
        Write-Host "Font $font is already installed, skipping" -ForegroundColor Green
        continue
    }

    Write-Host "Installing font $font" -ForegroundColor Cyan
    try
    {
        Install-NerdFont -Name $font
        Write-Host "Font $font installed successfully!" -ForegroundColor Green
    }
    catch
    {
        Write-Host "Failed to install $font : $($_.Exception.Message)" -ForegroundColor Red
    }
}

Write-Host "All fonts installed successfully!" -ForegroundColor Green
