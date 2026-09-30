# ============================================
# Royal Technology Solutions
# Server Health Check
#
# Purpose:
# Collects Windows Server health information
# for infrastructure validation.
#
# ============================================

Clear-Host

Write-Host "====================================="
Write-Host " Royal Technology Solutions"
Write-Host " Server Health Check Report"
Write-Host "====================================="

Write-Host ""

# System Information

$ComputerInfo = Get-ComputerInfo

Write-Host "Hostname:"
hostname

Write-Host ""

Write-Host "Operating System:"
$ComputerInfo.WindowsProductName

Write-Host ""

Write-Host "OS Version:"
$ComputerInfo.WindowsVersion


# Uptime

Write-Host ""
Write-Host "System Uptime:"

(Get-CimInstance Win32_OperatingSystem).LastBootUpTime


# CPU

Write-Host ""
Write-Host "CPU Usage:"

Get-Counter '\Processor(_Total)\% Processor Time' |
Select-Object -ExpandProperty CounterSamples |
Select-Object CookedValue


# Memory

Write-Host ""
Write-Host "Memory Status:"

Get-CimInstance Win32_OperatingSystem |
Select-Object `
@{Name="TotalGB";Expression={
[math]::Round($_.TotalVisibleMemorySize/1MB,2)
}},
@{Name="FreeGB";Expression={
[math]::Round($_.FreePhysicalMemory/1MB,2)
}}


# Disk

Write-Host ""
Write-Host "Disk Space:"

Get-PSDrive -PSProvider FileSystem |
Select Name,
@{Name="UsedGB";Expression={
[math]::Round($_.Used/1GB,2)
}},
@{Name="FreeGB";Expression={
[math]::Round($_.Free/1GB,2)
}}


# Important Services

Write-Host ""
Write-Host "Critical Services:"

$Services = @(
"DNS",
"DHCPServer",
"Netlogon",
"Spooler",
"postgresql-x64-18"
)

foreach ($Service in $Services){

Get-Service $Service -ErrorAction SilentlyContinue |
Select Name,Status

}


Write-Host ""
Write-Host "====================================="
Write-Host " Health Check Complete"
Write-Host "====================================="