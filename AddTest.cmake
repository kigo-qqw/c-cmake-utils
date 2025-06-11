function(add_c_test)
    set(options)
    set(one_value_keywords NAME)
    set(multi_value_keywords SOURCES DEPENDENCIES C_FLAGS)
    cmake_parse_arguments(PARSE_ARGV 0 "add_c_test"
            "${options}"
            "${one_value_keywords}"
            "${multi_value_keywords}")

    add_executable("${add_c_test_NAME}")
    set_target_properties("${add_c_test_NAME}" PROPERTIES LANGUAGE C)
    set_target_properties("${add_c_test_NAME}" PROPERTIES LINKER_LANGUAGE C)
    set_target_properties("${add_c_test_NAME}" PROPERTIES C_STANDARD 23)

    if (add_c_test_SOURCES)
        target_sources("${add_c_test_NAME}" PRIVATE "${add_c_test_SOURCES}")
    endif ()

    target_link_libraries("${add_c_test_NAME}" PRIVATE "${add_c_test_DEPENDENCIES}")
    target_compile_options("${add_c_test_NAME}"
            PRIVATE
            "-Wno-pre-c23-compat"
            "${add_c_test_C_FLAGS}"
    )

    add_test(NAME "${add_c_test_NAME}" COMMAND "${add_c_test_NAME}")
endfunction()
