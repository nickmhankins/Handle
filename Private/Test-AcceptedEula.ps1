function Test-AcceptedEula {

    # Test if the EulaAccepted property exists and create it if it does not
    if((Get-ItemProperty HKCU:\Software\Sysinternals\Handle -ErrorAction SilentlyContinue).EulaAccepted -ne '1') {
            & reg.exe ADD HKCU\Software\Sysinternals\Handle /v EulaAccepted /t REG_DWORD /d 1 /f 2>&1>$null
            Write-Host 'Eula has been auto-accepted'
        }

}