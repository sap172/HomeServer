$ProcessName = "openttd"
$DefaultLaunchScriptPath = "C:\Program Files\OpenTTD\openttd.exe"
$Arguments = "-D"

if(!(Get-Process -Name $ProcessName -ErrorAction SilentlyContinue)) {
    Start-Process $DefaultLaunchScriptPath -ArgumentList $Arguments
    Start-Sleep -s 5

    if(Get-Process -Name $ProcessName -ErrorAction SilentlyContinue) {
        Write-Host "Process started successfully"
    }
    else {
        Write-Host "Process failed to start"
    }
}
else {
    Write-Host "Process already running"
}