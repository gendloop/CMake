function doCommands {
    process {
        $exist = Test-Path $_
        if ($exist -eq $true) {
            Remove-Item -Path $_ -Recurse
            Write-Host Remove Path $_
            Write-Host ''
        }
        else {
            Write-Host Path $_ is not exist
            Write-Host ''
        }
    }
}

Get-ChildItem -Path . -Recurse -Name -Directory -Filter build | doCommands