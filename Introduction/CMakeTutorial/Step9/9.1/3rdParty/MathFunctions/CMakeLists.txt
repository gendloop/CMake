option(USE_MYMATH "Use my math" ON)

#  MathFunctions
add_library(MathFunctions SHARED
    math_functions.h
    math_functions.cpp
)
target_include_directories(MathFunctions INTERFACE ${CMAKE_CURRENT_SOURCE_DIR})
target_compile_definitions(MathFunctions PRIVATE "USE_MYMATH")
target_compile_definitions(MathFunctions PRIVATE "EXPORTING_MYMATH")

if(USE_MYMATH)
    # MySqrt
    add_library(MySqrt SHARED
        MySqrt/my_sqrt.h
        MySqrt/my_sqrt.cpp
    )
    target_compile_definitions(MySqrt PRIVATE "EXPORTING_MYSQRT")
    target_include_directories(MySqrt INTERFACE ${CMAKE_CURRENT_SOURCE_DIR}/MySqrt)

    # MyAdd
    add_library(MyAdd SHARED
        MyAdd/my_add.h
        MyAdd/my_add.cpp
    )
    target_compile_definitions(MyAdd PRIVATE "EXPORTING_MYADD")
    target_include_directories(MyAdd INTERFACE ${CMAKE_CURRENT_SOURCE_DIR}/MyAdd)
    
    target_link_libraries(MathFunctions PRIVATE MySqrt)
    target_link_libraries(MathFunctions PRIVATE MyAdd)
endif()


set(installable_libs MathFunctions)
if(TARGET MySqrt)
    list(APPEND installable_libs MySqrt)
endif()
if(TARGET MyAdd) 
    list(APPEND installable_libs MyAdd)
endif()

install(TARGETS ${installable_libs}
    RUNTIME DESTINATION bin
)
install(TARGETS MathFunctions
    LIBRARY DESTINATION lib
)
install(FILES math_functions.h
    DESTINATION include
)
