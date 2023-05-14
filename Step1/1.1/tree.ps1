# tree
$current_path = $PSScriptRoot
pushd $current_path
$exist = Test-Path tree.txt
if ($exist -eq $true) {
    Remove-Item -Path tree.txt
}
git-bash.exe -c "tree -L 3 -F -I tree --dirs-first > tree.txt"
popd