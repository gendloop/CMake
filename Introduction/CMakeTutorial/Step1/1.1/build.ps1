$exist = Test-Path build
if ($exist -eq $false) {
    mkdir build
}

pushd build
cmake ..
cmake --build .
Debug\Tutorial.exe
Debug\Tutorial.exe 9

popd