cmake_minimum_required(VERSION 3.10)

project(Step9 VERSION 1.9.1)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIED True)

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${PROJECT_BINARY_DIR}/archive")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${PROJECT_BINARY_DIR}/lib")
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${PROJECT_BINARY_DIR}/bin")

option(BUILD_SHARED_LIBS "Build using shared libraries" ON)

configure_file(config.h.in config.h)

add_library(MathFunctions)

add_executable(Step9 src/main.cpp)
target_link_libraries(Step9 PRIVATE MathFunctions)





