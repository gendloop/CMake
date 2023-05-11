$exist = Test-Path build
if ($exist -eq $false) {
    mkdir build
}
cd build
cmake ..
cmake --build .
Debug\Tutorial.exe
Debug\Tutorial.exe 9