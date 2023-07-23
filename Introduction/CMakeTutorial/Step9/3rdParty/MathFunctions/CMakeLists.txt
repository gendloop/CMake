add_library(MathFunctions SHARED
    math_functions.h
    math_functions.cpp
)

target_include_directories(MathFunctions INTERFACE ${CMAKE_CURRENT_SOURCE_DIR})

option(USE_MYMATH "Use my math" ON)

if(USE_MYMATH)
    target_compile_definitions(MathFunctions PRIVATE "USE_MYMATH")

    add_library(MySqrt STATIC
        MySqrt/my_sqrt.cpp
    )
    
    target_link_libraries(MathFunctions PRIVATE MySqrt)
endif()

target_compile_definitions(MathFunctions PRIVATE "EXPORTING_MYMATH")

set(installable_libs MathFunctions)
if(TARGET MySqrt)
    list(APPEND installable_libs MySqrt)
endif()

install(TARGETS ${installable_libs}
    DESTINATION lib
)
install(FILES math_functions.h
    DESTINATION include
)




