function doCommands {
    process {
        $exist = Test-Path $_
        if ($exist -eq $true) {
            powershell.exe -File $_ 
            Write-Host Run $_
            Write-Host ''
        }
        else {
            Write-Host Path $_ is not exist
            Write-Host ''
        }
    }
}

powershell.exe ./Subdirectory_DeleteBuild.ps1
Get-ChildItem -Path . -Recurse -Name -File -Filter tree.ps1 | doCommands