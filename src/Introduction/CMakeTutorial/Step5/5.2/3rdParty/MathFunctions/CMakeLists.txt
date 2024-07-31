add_library(MathFunctions
            mysqrt.cxx
            )

target_include_directories(MathFunctions
                        INTERFACE
                        ${CMAKE_CURRENT_SOURCE_DIR}
                        )

# does this system provide the log and exp func ?
include(CheckCXXSourceCompiles)
check_cxx_source_compiles("
    #include <cmath>
    int main() {
        std::log(1.0);
        return 0;
    }
" HAVE_LOG)
check_cxx_source_compiles("
    #include <cmath>
    int main() {
        std::exp(1.0);
        return 0;
    }
" HAVE_EXP)

if(HAVE_LOG AND HAVE_EXP)
    target_compile_definitions(MathFunctions
        INTERFACE "HAVE_LOG" "HAVE_EXP"
    )
endif()


# install
install(TARGETS MathFunctions DESTINATION lib)
install(FILES MathFunctions.h DESTINATION include/MathFunctions)
