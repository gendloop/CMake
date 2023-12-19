cmake_minimum_required(VERSION 3.10)

set(MathFunctions_DIR "../11.1/build/install/lib/cmake/MathFunctions")

find_package(MathFunctions CONFIG
	REQUIRED COMPONENTS Step9::MyAdd
)

project(TestStep9 VERSION 1.9.2)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

if(MathFunctions_FOUND)
	add_executable(${PROJECT_NAME} src/main.cpp)

	target_link_libraries(TestStep9 PRIVATE Step9::MyAdd)

	include(CTest)
	add_test(NAME T1 COMMAND TestStep9)
endif()
