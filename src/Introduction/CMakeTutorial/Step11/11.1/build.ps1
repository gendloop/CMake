if((Test-Path build) -eq $true) {
    Remove-Item -Path build/** -Recurse
}
else {
    New-Item -Path . -Name .\build -ItemType Directory
}

Push-Location build

cmake .. -DUSE_MYMATH=ON
cmake --build . --config Debug

cmake --install . --config Debug --prefix "./install"

ctest -VV -C Debug

Pop-Location
