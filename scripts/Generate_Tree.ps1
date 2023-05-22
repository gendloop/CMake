function doCommands {
    process {
        $dest = "$_"

        $exist = Test-Path $dest
        if ($exist -eq $true) {
            powershell.exe -File $dest 
            Write-Host Run $dest
            Write-Host ''
        }
        else {
            Write-Host Path $dest is not exist
            Write-Host ''
        }
    }
}

# delete build folder if exists
if((Test-Path ./Subdirectory_DeleteBuild.ps1) -eq $true) {
    ./Subdirectory_DeleteBuild.ps1
}

# generate tree
Push-Location ..
Get-ChildItem -Path . -Recurse -Name -File -Filter tree.ps1 | doCommands
Pop-Location