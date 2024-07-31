if((Test-Path build) -eq $true) {
    Remove-Item -Path build/** -Recurse
}
else {
    New-Item -Path . -Name .\build -ItemType Directory
}

Push-Location build

cmake ..
cmake --build . --config Debug
ctest -C Debug -VV

Pop-Location