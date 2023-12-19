cmake_minimum_required(VERSION 3.10)

set(MathFunctions_PATH "${CMAKE_CURRENT_SOURCE_DIR}/../11.1/build/install")

project(TestStep9 VERSION 1.9.2)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

add_executable(${PROJECT_NAME} src/main.cpp)

target_include_directories(TestStep9 PRIVATE ${MathFunctions_PATH}/include)
target_link_libraries(TestStep9 PRIVATE ${MathFunctions_PATH}/lib/MathFunctions.lib)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${PROJECT_BINARY_DIR}")
file(COPY "${MathFunctions_PATH}/bin/MathFunctions.dll" DESTINATION "${PROJECT_BINARY_DIR}/Debug")

include(CTest)
add_test(NAME T1 COMMAND TestStep9)
