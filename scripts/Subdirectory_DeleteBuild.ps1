function doCommands {
    process {
        $dest = "$_"

        $exist = Test-Path $dest
        if ($exist -eq $true) {
            Remove-Item -Path $dest -Recurse -Force
            Write-Host Remove Path $dest
            Write-Host ''
        }
        else {
            Write-Host Path $_ is not exist
            Write-Host ''
        }
    }
}

Push-Location ..
Get-ChildItem -Path . -Recurse -Name -Directory -Filter build | doCommands
Pop-Location
