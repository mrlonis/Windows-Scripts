if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "Destiny-2.ps1: Launching Administrator PowerShell..."
    Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit 
}

#region Set Firewall Rules
#region Outbound
New-NetFirewallRule -DisplayName "Destiny-2-Outbound-All" -Program "C:\Program Files (x86)\Steam\steamapps\common\Destiny 2\destiny2.exe" -Direction Outbound -Action Allow

New-NetFirewallRule -DisplayName "Destiny-2-TCP-Outbound-All" -Program "C:\Program Files (x86)\Steam\steamapps\common\Destiny 2\destiny2.exe" -Direction Outbound -Protocol TCP -Action Allow

New-NetFirewallRule -DisplayName "Destiny-2-UDP-Outbound-All" -Program "C:\Program Files (x86)\Steam\steamapps\common\Destiny 2\destiny2.exe" -Direction Outbound -Protocol TCP -Action Allow

New-NetFirewallRule -DisplayName "Destiny-2-TCP-Outbound-Specific" -Direction Outbound -RemotePort 80, 443, 1119-1120, 3074, 3724, 4000, 6112-6114, 7500-7509, 30000-30009 -Protocol TCP -Action Allow

New-NetFirewallRule -DisplayName "Destiny-2-UDP-Outbound-Specific" -Direction Outbound -RemotePort 80, 443, 1119-1120, 3074, 3097-3196, 3724, 4000, 6112-6114, 27015-27200 -Protocol UDP -Action Allow
#endregion

#region Inbound
New-NetFirewallRule -DisplayName "Destiny-2-Inbound-All" -Program "C:\Program Files (x86)\Steam\steamapps\common\Destiny 2\destiny2.exe" -Direction Inbound -Action Allow

New-NetFirewallRule -DisplayName "Destiny-2-TCP-Inbound-All" -Program "C:\Program Files (x86)\Steam\steamapps\common\Destiny 2\destiny2.exe" -Direction Inbound -Protocol TCP -Action Allow

New-NetFirewallRule -DisplayName "Destiny-2-UDP-Inbound-All" -Program "C:\Program Files (x86)\Steam\steamapps\common\Destiny 2\destiny2.exe" -Direction Inbound -Protocol TCP -Action Allow

New-NetFirewallRule -DisplayName "Destiny-2-TCP-Inbound-Specific" -Direction Inbound -RemotePort 80, 443, 1119-1120, 3074, 3724, 4000, 6112-6114, 7500-7509, 30000-30009 -Protocol TCP -Action Allow

New-NetFirewallRule -DisplayName "Destiny-2-UDP-Inbound-Specific" -Direction Inbound -RemotePort 80, 443, 1119-1120, 3074, 3097-3196, 3724, 4000, 6112-6114, 27015-27200 -Protocol UDP -Action Allow
#endregion
#endregion