$exist = Test-Path build
if ($exist -eq $false) {
    mkdir build
}

pushd build
cmake ..
cmake --build .
Debug\Step2.exe
Debug\Step2.exe 9
popd
