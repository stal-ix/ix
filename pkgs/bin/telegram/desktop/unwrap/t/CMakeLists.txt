# This file is part of Desktop App Toolkit,
# a set of libraries for developing nice desktop applications.
#
# For license and copyright information please follow this link:
# https://github.com/desktop-app/legal/blob/master/LEGAL

add_library(external_kimageformats STATIC)
add_library(desktop-app::external_kimageformats ALIAS external_kimageformats)
init_target(external_kimageformats "(external)")

set(kimageformats_loc ${third_party_loc}/kimageformats)
set(kimageformats_src ${kimageformats_loc}/src/imageformats)

set_target_properties(external_kimageformats PROPERTIES AUTOMOC ON)

nice_target_sources(external_kimageformats ${kimageformats_src}
PRIVATE
    avif.cpp
    heif.cpp
    jxl.cpp
)

target_compile_definitions(external_kimageformats
PRIVATE
    QT_STATICPLUGIN
    KIMG_JXL_API_VERSION=70
)

target_link_libraries(external_kimageformats
PRIVATE
    desktop-app::external_qt
)

if (DESKTOP_APP_USE_PACKAGED)
    find_package(libavif REQUIRED)
    find_package(PkgConfig REQUIRED)
    pkg_check_modules(LIBHEIF REQUIRED IMPORTED_TARGET libheif)
    pkg_check_modules(LIBJXL REQUIRED IMPORTED_TARGET libjxl)
    pkg_check_modules(LIBJXL_THREADS REQUIRED IMPORTED_TARGET libjxl_threads)

    target_link_libraries(external_kimageformats
    PRIVATE
        avif
        PkgConfig::LIBHEIF
        PkgConfig::LIBJXL
        PkgConfig::LIBJXL_THREADS
    )
else()
    target_link_static_libraries(external_kimageformats
    PRIVATE
        avif
        heif
        jxl
        jxl_threads
        dav1d
        libde265
        brotlidec-static
        brotlienc-static
        brotlicommon-static
        hwy
        lcms2
    )
endif()
