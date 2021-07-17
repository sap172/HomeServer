$actionList = "START","STOP"
$listOfProcessNames = "DONTSTARVE"

function Execute-ServerProcessInternal {
    param(
        [Parameter( Mandatory=$true,
                    ParameterSetName="Action",
                    HelpMessage="Action to perform. [START, STOP]")]
        [String] $Action,
        [Parameter( Mandatory=$true,
                    ParameterSetName="Action",
                    HelpMessage="Process name to perform action on. [DONTSTARVE]")]
        [String] $ProcessName
    )

    # Validate parameters
    if (!$listOfProcessNames.Contains($ProcessName.ToUpper()))
    {
        Write-Host "ProcessName is not valid!"
        exit
    }
    if (!$actionList.Contains($Action.ToUpper()))
    {
        Write-Host "Action is not valid!"
        exit
    }

    $targetScript = ""
    
    # Stop Process
    if ($Action.ToUpper().Equals($actionList[1])) {
        $targetScript = $PSScriptRoot + "/" + $ProcessName.ToUpper() + "/StopProcess.ps1"
    }    
    # Start Process
    elseif ($Action.ToUpper().Equals($actionList[0])) {
        $targetScript = $PSScriptRoot + "/" + $ProcessName.ToUpper() + "/StartProcess.ps1"
    }
    else {
        Write-Host "Action is not implemented!"
        exit
    }

    Invoke-Expression -Command $targetScript
}

Execute-ServerProcessInternal
