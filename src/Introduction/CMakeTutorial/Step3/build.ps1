$exist = Test-Path build
if ($exist -eq $false) {
    mkdir build
}

pushd build

# use math
Write-Host "define USE_MATH" -BackgroundColor Green
cmake .. -DUSE_MATH=ON
cmake --build .
Debug/Step2
Debug/Step2 4

popd
