# cmake version
cmake_minimum_required(VERSION 3.10)

# project
project(Step2Project VERSION 2.0)

# c++ standard
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# define variables
option(USE_MATH "Use my math functions" ON)

# config file
configure_file(Config.h.in config.h)

# 3rdParty
if(USE_MATH)
    add_subdirectory(3rdParty/MathFunctions)
    list(APPEND EXTRA_LIBS MathFunctions)
endif()

# target
add_executable(Step2 src/main.cpp)

# target link
target_link_libraries(Step2 PUBLIC
                    ${EXTRA_LIBS}
)   

# target include
target_include_directories(Step2 PUBLIC
                        "${PROJECT_BINARY_DIR}"
)

#install
install(TARGETS Step2 DESTINATION bin)
install(FILES "${PROJECT_BINARY_DIR}/config.h"
    DESTINATION include
    )

enable_testing()

# Basic form: dose the application run
add_test(NAME RUN COMMAND Step2 9)
