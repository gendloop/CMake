cmake_minimum_required(VERSION 3.10)

project(Step9 VERSION 1.9.1)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIED True)

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${PROJECT_BINARY_DIR}")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${PROJECT_BINARY_DIR}")
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${PROJECT_BINARY_DIR}")

configure_file(config.h.in config.h)

add_subdirectory(3rdParty/MathFunctions)

add_executable(Step9 src/main.cpp)
target_include_directories(Step9 PRIVATE ${CMAKE_BINARY_DIR})
target_link_libraries(Step9 PUBLIC MathFunctions)

include(CTest)
add_test(NAME Runs COMMAND Step9 25)
set_tests_properties(Runs
    PROPERTIES PASS_REGULAR_EXPRESSION "The square root of [0-9]+ is [0-9]+"
)

function(do_test target arg result)
    add_test(NAME Comp${arg} COMMAND ${target} ${arg})
    set_tests_properties(Comp${arg}
        PROPERTIES PASS_REGULAR_EXPRESSION ${result}
    )
endfunction()

do_test(Step9 4 "The square root of 4 is 2")
do_test(Step9 9 "The square root of 9 is 3")




