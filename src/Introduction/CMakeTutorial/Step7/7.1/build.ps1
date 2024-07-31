$exist = Test-Path build
if ($exist -eq $true) {
    Remove-Item -Path build/** -Recurse
}
else {
    New-Item -Path . -Name .\build -ItemType Directory
}

Push-Location build

# use math
Write-Host "define USE_MATH" -ForegroundColor Green
cmake .. -DUSE_MATH=ON
cmake --build . --config Debug
cmake --build . --config Release

ctest -C Debug -V

cmake --install . --prefix "./install"

cpack -G ZIP -C Debug

Pop-Location
