# This file is part of Desktop App Toolkit,
# a set of libraries for developing nice desktop applications.
#
# For license and copyright information please follow this link:
# https://github.com/desktop-app/legal/blob/master/LEGAL

function(generate_cppgir target_name gir)
    # cppgir generates all the dependent headers everytime, better to have a global folder
    set(gen_dst ${CMAKE_BINARY_DIR}/gen)
    file(MAKE_DIRECTORY ${gen_dst})

    set(gen_timestamp ${gen_dst}/${target_name}_cppgir.timestamp)

    set(gir_path)
    if (IS_ABSOLUTE "${gir}")
        set(gir_path ${gir})
    endif()

    add_custom_command(
    OUTPUT
        ${gen_timestamp}
    COMMAND
        cppgir
        --debug
        1
        --class
        --class-full
        --expected
        --optional
        --ignore
        ${cmake_helpers_loc}/external/glib/cppgir/data/cppgir.ignore:${cmake_helpers_loc}/external/glib/cppgir/data/cppgir_unix.ignore
        --output
        ${gen_dst}
        ${gir}
    COMMAND
        echo 1> ${gen_timestamp}
    COMMENT "Generating C++ wrapper for ${gir} (${target_name})"
    DEPENDS
        ${gir_path}
    )
    generate_target(${target_name} cppgir ${gen_timestamp} "" ${gen_dst})

    get_target_property(target_type ${target_name} TYPE)
    if (${target_type} STREQUAL "INTERFACE_LIBRARY")
        target_compile_definitions(${target_name} INTERFACE GI_INLINE GI_OBJECT_NEWV)
    else()
        target_compile_definitions(${target_name} PUBLIC GI_INLINE GI_OBJECT_NEWV)
    endif()
endfunction()
