$ProcessName = "dontstarve_dedicated_server_nullrenderer"
$DefaultLaunchScriptPath = "C:\Program Files (x86)\Steam\steamapps\common\Don't Starve Together Dedicated Server\bin\scripts\launch_preconfigured_servers.bat"

if(!(Get-Process -Name $ProcessName -ErrorAction SilentlyContinue)) {
    Start-Process $DefaultLaunchScriptPath
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