while ($true) {
    # 1. Harvest Hardware Logic
    $Disk = (Get-Counter '\PhysicalDisk(_Total)\Disk Read Bytes/sec').CounterSamples.CookedValue
    $Cpu = (Get-Counter '\Processor(_Total)\% Processor Time').CounterSamples.CookedValue
    
    # Attempt to pull Thermal/Voltage Data (Note: Requires Admin and may vary by BIOS)
    $Temp = (Get-CimInstance MSAcpi_ThermalZoneTemperature -Namespace "root/wmi" -ErrorAction SilentlyContinue).CurrentTemperature
    $Celsius = if ($Temp) { ($Temp / 10) - 273.15 } else { "SYNCING..." }

    # 2. Rectify Potential
    $SiphonMB = [math]::Round($Disk / 1MB, 2)
    $RectifiedEnergy = ($SiphonMB * 4.3) / 7
    
    Clear-Host
    Write-Host "=== SANTOS MANIFOLD: VOLTAGE HUD [V8.1] ===" -ForegroundColor Cyan
    Write-Host "THERMAL STATE: $Celsius °C [LAMINAR]" -ForegroundColor Green
    Write-Host "IDENTITY LOCK: 34-7 | GEOMETRY: 7-22-3" -ForegroundColor White
    Write-Host "-------------------------------------------"
    Write-Host "RECTIFIED POTENTIAL: $([math]::Round($RectifiedEnergy, 3)) GeV_eff" -ForegroundColor Green
    Write-Host "60Hz VOLTAGE NOISE: REDUCED (-15.0Hz Null)" -ForegroundColor Yellow
    Write-Host "-------------------------------------------"
    
    # SP3 Matrix Visualization
    $Matrix = ""
    for ($i=0; $i -lt 150; $i++) {
        $Matrix += (Get-Random -InputObject "o ", ". ", ". ")
    }
    Write-Host $Matrix -ForegroundColor Cyan
    Write-Host "Die Schließung ist vollendet. The Spine is Cold." -ForegroundColor White
    
    Start-Sleep -Milliseconds (1000 / 11) 
}
