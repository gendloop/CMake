# cmake version
cmake_minimum_required(VERSION 3.10)

# project
project(Step2Project VERSION 2.0.1)

# c++ standard
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# define variables
option(USE_MATH "Use my math functions" ON)

# config file
configure_file(Config.h.in config.h)

# generate MakeATable.exe
add_executable(MakeATable MakeTable.cpp)

# adding custom command
add_custom_command(
    OUTPUT ${PROJECT_SOURCE_DIR}/src/a_table.h
    COMMAND MakeATable ${PROJECT_SOURCE_DIR}/src/a_table.h
    DEPENDS MakeATable
)

# 3rdParty
if(USE_MATH)
    add_subdirectory(3rdParty/MathFunctions)
    list(APPEND EXTRA_LIBS MathFunctions)
endif()

# target
add_executable(Step2 
    src/main.cpp
    ${PROJECT_SOURCE_DIR}/src/a_table.h
)

# target link
target_link_libraries(Step2 PRIVATE
                    ${EXTRA_LIBS}
)

# target include
target_include_directories(Step2 PRIVATE
                        "${PROJECT_BINARY_DIR}"
                        "${PROJECT_SOURCE_DIR}/src"
)

#install
install(TARGETS Step2 
    DESTINATION bin
)
install(FILES "${PROJECT_BINARY_DIR}/config.h"
    DESTINATION include
)

enable_testing()

# Basic form: dose the application run
add_test(
    NAME test1 
    COMMAND Step2 2
)
add_test(
    NAME test2 
    COMMAND Step2 4
)
add_test(
    NAME test3
    COMMAND Step2 6
)

# include runtime module
# include(InstallRequiredSystemLibraries)

# set some CPACK variables
set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_SOURCE_DIR}/License.txt")
set(CPACK_PACKAGE_VERSION_MAJOR "${Step2Project_VERSION_MAJOR}")
set(CPACK_PACKAGE_VERSION_MINOR "${Step2Project_VERSION_MINOR}")
set(CPACK_PACKAGE_VERSION_MINOR "${Step2Project_VERSION_PATCH}")
set(CPACK_SOURCE_GENERATOR "TAG")

# include CPACK module
include(CPACK)