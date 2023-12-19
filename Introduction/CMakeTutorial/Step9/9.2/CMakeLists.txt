cmake_minimum_required(VERSION 3.10)

project(Step9 VERSION 1.9.2)

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
add_test(NAME Runs COMMAND Step9)
set_tests_properties(Runs
    PROPERTIES PASS_REGULAR_EXPRESSION ".*[0-9]+\.[0-9]+\.[0-9]+"
)

function(do_sqr_test target arg result)
    add_test(NAME Sqr${arg}
        COMMAND ${target} ${arg}
    )
    set_tests_properties(Sqr${arg}
        PROPERTIES PASS_REGULAR_EXPRESSION ${result}
    )
endfunction()

do_sqr_test(Step9 4 "The square root of 4 is 2")
do_sqr_test(Step9 9 "The square root of 9 is 3")

function(do_add_test target x y ret)
    add_test(NAME Add${x}-${y}
        COMMAND ${target} ${x} ${y}
    )
    set_tests_properties(Add${x}-${y}
        PROPERTIES PASS_REGULAR_EXPRESSION ${ret}
    )
endfunction()

do_add_test(Step9 1 2 "The add result of [0-9.]+ and [0-9.]+ is [0-9.]+")
do_add_test(Step9 2 4 "The add result of [0-9.]+ and [0-9.]+ is [0-9.]+")
