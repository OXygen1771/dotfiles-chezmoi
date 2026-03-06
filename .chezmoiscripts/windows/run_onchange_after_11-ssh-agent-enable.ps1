Write-Host "[INFO] Setting up ssh-agent service, you will see a prompt to elevate this (and only this!) script's permissions"

# Self-elevate the script if required
if (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator'))
{
    if ([int](Get-CimInstance -Class Win32_OperatingSystem | Select-Object -ExpandProperty BuildNumber) -ge 6000)
    {
        $CommandLine = "-File `"" + $MyInvocation.MyCommand.Path + "`" " + $MyInvocation.UnboundArguments
        Start-Process -Wait -FilePath pwsh.exe -Verb Runas -ArgumentList $CommandLine
    Exit
    }
}

### ssh-agent
$sshAgent = Get-Service -Name ssh-agent -ErrorAction SilentlyCOntinue
if ($sshAgent)
{
    if ($sshAgent.Status -ne 'Running' -or $sshAgent.Status -ne 'Automatic')
    {
        try
	{
	    powershell -Command "Start-Process powershell -Verb RunAs -ArgumentList 'Set-Service ssh-agent -StartupType Automatic; Start-Service ssh-agent'"
	    Write-Host "[INFO] ssh-agent service started" -ForegroundColor Cyan
	}
	catch
	{
	    Write-Warning "ssh-agent is not running. Try running 'Start-Service ssh-agent' as an administrator"
	}
    }
}

Write-Host "[INFO] This window will be closed automatically in 3 seconds"
Start-Sleep 3
Exit
