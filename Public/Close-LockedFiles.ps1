Function Close-LockedFiles {

    [cmdletbinding()]

    param (
            [Parameter(Mandatory,Position=0,ValueFromPipelineByPropertyName,ValueFromPipeline)]
            [ValidateScript({Test-Path $_})]
            [string]$Path
    )

        Begin {
            Test-AcceptedEula
        }
        Process {
        Get-LockedFiles -Path $Path | ForEach-Object {      
            & handle.exe -c $_.User -p $_.ProcessId -y 2>&1>$null
            Write-Host "Closed PID $($_.ProcessID) running in path $($_.Path)" -ForegroundColor Green     
        }  
    }        
}