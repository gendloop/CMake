# cmake version
cmake_minimum_required(VERSION 3.10)

# project
project(Step2Project VERSION 2.0)

# c++ standard
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED, True)

# define variables
option(USE_MATH "Use my math functions" ON)

# config file
configure_file(Config.h.in config.h)

# 3rdParty
if(USE_MATH)
    add_subdirectory(3rdParty/MathFunctions)
    list(APPEND EXTRA_LIBS MathFunctions)
    list(APPEND EXTRA_INCLUDES "${PROJECT_SOURCE_DIR}/3rdParty/MathFunctions")
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
                        ${EXTRA_INCLUDES}
)
