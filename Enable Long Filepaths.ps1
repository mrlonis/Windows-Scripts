Write-Host "Starting..."

$Registry_Path = "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem"
$Registry_Key = "LongPathsEnabled"
$Registry_Value = "1"

if (!(Test-Path $Registry_Path)) {
    New-Item -Path $Registry_Path -Force | Out-Null

    New-ItemProperty -Path $Registry_Path -Name $Registry_Key -Value $Registry_Value -PropertyType DWORD -Force | Out-Null
} else {
    Write-Host "Updating Registry Value..."
    New-ItemProperty -Path $Registry_Path -Name $Registry_Key -Value $Registry_Value -PropertyType DWORD -Force | Out-Null
}

Write-Host "Finished!"