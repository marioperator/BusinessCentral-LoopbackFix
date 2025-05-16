<#
.SYNOPSIS
    Disables the loopback check on Windows systems.

.DESCRIPTION
    This script modifies the registry to set the DisableLoopbackCheck DWORD value to 1,
    resolving Windows authentication issues when accessing Business Central URLs
    from the same machine using a public FQDN.

.NOTES
    Author: Mario Mancini
    Created: 2025-05-16
    For development/testing use only.

.LINK
    https://learn.microsoft.com/en-us/troubleshoot/windows-server/networking/disable-loopback-check
#>

$registryPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa"
$valueName = "DisableLoopbackCheck"
$valueData = 1

Write-Host "▶️ Starting registry update to disable loopback check..."

if (-not (Get-ItemProperty -Path $registryPath -Name $valueName -ErrorAction SilentlyContinue)) {
    Write-Host "➕ Value '$valueName' not found. Creating it..."
    New-ItemProperty -Path $registryPath -Name $valueName -PropertyType DWord -Value $valueData -Force
} else {
    Write-Host "✏️ Value '$valueName' already exists. Updating it..."
    Set-ItemProperty -Path $registryPath -Name $valueName -Value $valueData
}

$currentValue = Get-ItemProperty -Path $registryPath -Name $valueName
Write-Host "`n✅ Current value of '$valueName': $($currentValue.$valueName)"
Write-Host "`nℹ️ Operation completed. Restart the machine if necessary (not usually required on Windows Server 2022)."
