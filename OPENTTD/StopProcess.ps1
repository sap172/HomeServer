$ProcessName = "openttd"

if(Get-Process -Name $ProcessName -ErrorAction SilentlyContinue) {
    Stop-Process -Name $ProcessName

    if(Get-Process -Name $ProcessName -ErrorAction SilentlyContinue) {
        Write-Host "Process stopped successfully"
    }
    else {
        Write-Host "Process failed to stop"
    }
}
else {
    Write-Host "Process not running"
}