Function Get-LockedFiles {

    [cmdletbinding()]

    param (
            [Parameter(Mandatory,Position=0,ValueFromPipeline)]
            [ValidateScript({Test-Path $_})]
            [string]$Path
    )
    
    Begin {
        Test-AcceptedEula
    }
    Process {
        $HandleCollection = @()

        $Output = & handle.exe $Path
        $Lines = $Output.trim() -like "*pid:*"
        if($Lines) {
            foreach($Line in $Lines){
                $Result = $Line | Select-String -Pattern '^([^ ]*)\s*pid: ([0-9]*)\s*type: ([^ ]*)\s*([^ ]*)\s*(.*?): (.*)'
                $Handle = [PSCustomObject] @{
                    ProcessName =  $Result.Matches[0].Groups[1].Value
                    ProcessId = [int]::Parse( $Result.Matches[0].Groups[2].Value)
                    Type = $Result.Matches[0].Groups[3].Value
                    User = $Result.Matches[0].Groups[4].Value
                    Path = $Result.Matches[0].Groups[6].Value
                }
                $HandleCollection += $Handle    
            }
            return $HandleCollection     
        }
        else {
            Write-Host "No locked files found or parent process already closed" -ForegroundColor Yellow
        }       
    }
}