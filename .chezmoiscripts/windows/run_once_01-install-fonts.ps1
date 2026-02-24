$fonts = @(
    "JetBrainsMono",
    "NerdFontsSymbolsOnly"
)

Write-Host "NerdFonts PowerShell module needed to install fonts. Trying to install..." -ForegroundColor Cyan
Install-PSResource -Name NerdFonts
Import-Module -Name NerdFonts
Write-Host "NerdFonts module installed!" -ForegroundColor Green

foreach ($font in $fonts)
{
    Write-Host "Installing font $font" -ForegroundColor Cyan
    Install-NerdFont -Name $font
    Write-Host "Font $font installed successfully!" -ForegroundColor Green
}

Write-Host "All fonts installed successfully!" -ForegroundColor Green
