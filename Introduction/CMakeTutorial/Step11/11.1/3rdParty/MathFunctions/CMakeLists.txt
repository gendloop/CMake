option(USE_MYMATH "Use my math" OFF)

#  MathFunctions
add_library(MathFunctions SHARED
    math_functions.h
    math_functions.cpp
)
target_include_directories(MathFunctions 
    INTERFACE 
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
    $<INSTALL_INTERFACE:include>
)
target_compile_definitions(MathFunctions PRIVATE "EXPORT")

if(USE_MYMATH)
    # MathFunctions
    target_compile_definitions(MathFunctions PRIVATE "USE_MYMATH")

    # MySqrt
    add_library(MySqrt STATIC
        MySqrt/my_sqrt.h
        MySqrt/my_sqrt.cpp
    )
    target_include_directories(MySqrt 
        INTERFACE 
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/MySqrt>
    )

    # MyAdd
    add_library(MyAdd STATIC
        MyAdd/my_add.h
        MyAdd/my_add.cpp
    )
    target_include_directories(MyAdd 
        INTERFACE
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/MyAdd>
        $<INSTALL_INTERFACE:include>
    )
    
    target_link_libraries(MathFunctions PRIVATE MySqrt)
    target_link_libraries(MathFunctions PRIVATE MyAdd)
endif()

set(installable_libs MathFunctions)

if(TARGET MySqrt)
    list(APPEND installable_libs MySqrt)
endif()

if(TARGET MyAdd)
    list(APPEND installable_libs MyAdd)
    install(FILES MyAdd/my_add.h DESTINATION include/MyAdd)
endif()

install(TARGETS ${installable_libs}
    EXPORT MathFunctionsTargets
    LIBRARY DESTINATION lib
)
install(FILES math_functions.h
    DESTINATION include
)


