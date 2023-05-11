function doCommands {
    process {
        $exist = Test-Path $_\build
        if ($exist -eq $true) {
            Remove-Item -Path $_\build -Recurse
            Write-Host Remove Path $_\build
            Write-Host ''
        }
        else {
            Write-Host Path $_\build is not exist
            Write-Host ''
        }
    }
}

Get-ChildItem -Path . -Name -Directory -Filter Step* | doCommands