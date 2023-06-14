# tree
$current_path = $PSScriptRoot
Push-Location $current_path
$exist = Test-Path tree.txt
if ($exist -eq $true) {
    Remove-Item -Path tree.txt
}
git-bash.exe -c "tree -L 3 -F -I 'tree.txt|tree.ps1|build.ps1|build' --dirsfirst --charset utf-8 > tree.txt"
Pop-Location