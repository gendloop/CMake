$exist = Test-Path build
if ($exist -eq $false) {
    mkdir build
}

pushd build

# not use math
Write-Host "undef USE_MATH" -BackgroundColor Green
cmake .. -DUSE_MATH=OFF
cmake --build .
Debug/Step2
Debug/Step2 4

# use math
Write-Host "define USE_MATH" -BackgroundColor Green
cmake .. -DUSE_MATH=ON
cmake --build .
Debug/Step2
Debug/Step2 4

popd
