if((Test-Path build) -eq $true) {
    Remove-Item -Path build/** -Recurse
}
else {
    New-Item -Path . -Name .\build -ItemType Directory
}

Push-Location build

$config_type = 'Debug'

mkdir $config_type

cmake -S .. -B $config_type -DUSE_MYMATH=ON
cmake --build ./$config_type --config $config_type

cmake --install ./$config_type --config $config_type --prefix "./$config_type/install"

ctest -VV -C $config_type --test-dir ./$config_type

cpack -G ZIP -B ./$config_type -C $config_type --config ./$config_type/CPackConfig.cmake

$config_type = 'Release'

mkdir $config_type

cmake -S .. -B $config_type -DUSE_MYMATH=ON
cmake --build ./$config_type --config $config_type

cmake --install ./$config_type --config $config_type --prefix "./$config_type/install"

ctest -VV -C $config_type --test-dir ./$config_type

cpack -G ZIP -B ./$config_type -C $config_type --config ./$config_type/CPackConfig.cmake

Pop-Location
