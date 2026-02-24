$fonts = @(
    "JetBrainsMono",
    "NerdFontsSymbolsOnlyMono"
)

Write-Host "NerdFonts PowerShell module needed to install fonts. Trying to install..." -ForegroundColor Cyan
Install-PSResource -Name NerdFonts
Import-Module -Name NerdFonts
Write-Host "NerdFonts module installed!" -ForegroundColor Green

foreach ($font in $fonts)
{
    $fontExists = (New-Object System.Drawing.Text.InstalledFontCollection).Families | Where-Object {($_.Name -replace '\s', '') -eq $font}
    if ($fontExists)
    {
        Write-Host "Font $font is already installed, skipping" -ForegroundColor Green
	continue
    }

    Write-Host "Installing font $font" -ForegroundColor Cyan
    Install-NerdFont -Name $font
    Write-Host "Font $font installed successfully!" -ForegroundColor Green
}

Write-Host "All fonts installed successfully!" -ForegroundColor Green
