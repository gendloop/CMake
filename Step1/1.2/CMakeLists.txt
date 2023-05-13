cmake_minimum_required(VERSION 3.10)

# set the <project name>
# project(Tutorials)

# set the <project name> and <version>
project(Tutorials VERSION 1.0)

configure_file(TutorialConfig.h.in TutorialConfig.h)

# add the executable
add_executable(Tutorial src/tutorials.cxx)

target_include_directories(Tutorial PUBLIC
                            "${PROJECT_BINARY_DIR}"
)

