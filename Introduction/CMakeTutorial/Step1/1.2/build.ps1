$exist = Test-Path build
if ($exist -eq $false) {
    mkdir build
}
Push-Location build
cmake ..
cmake --build .
Debug\Tutorial.exe
Debug\Tutorial.exe 9
Pop-Location