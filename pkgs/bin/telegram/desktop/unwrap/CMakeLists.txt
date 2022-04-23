# This file is part of Desktop App Toolkit,
# a set of libraries for developing nice desktop applications.
#
# For license and copyright information please follow this link:
# https://github.com/desktop-app/legal/blob/master/LEGAL

add_library(external_kwayland INTERFACE IMPORTED GLOBAL)
add_library(desktop-app::external_kwayland ALIAS external_kwayland)

if (DESKTOP_APP_USE_PACKAGED AND NOT DESKTOP_APP_QT6)
    if (DESKTOP_APP_USE_PACKAGED_LAZY)
        find_package(KF5Wayland QUIET)
    else()
        find_package(KF5Wayland)
    endif()

    if (KF5Wayland_FOUND)
        target_link_libraries(external_kwayland INTERFACE KF5::WaylandClient)
        return()
    endif()
endif()

add_library(external_kwayland_bundled STATIC IMPORTED)

include(ExternalProject)

ExternalProject_Add(extra-cmake-modules
    URL ${third_party_loc}/extra-cmake-modules
    CMAKE_GENERATOR Ninja
    CMAKE_ARGS
        -DCMAKE_BUILD_TYPE=Release
        -DCMAKE_INSTALL_PREFIX=<BINARY_DIR>
        -DCMAKE_INSTALL_DATADIR=share
        -DBUILD_TESTING=OFF
    BUILD_COMMAND ${CMAKE_COMMAND} --build <BINARY_DIR>
    COMMAND ${CMAKE_COMMAND} --install <BINARY_DIR>
    STEP_TARGETS build
    EXCLUDE_FROM_ALL TRUE
    BUILD_BYPRODUCTS <BINARY_DIR>/share/ECM/cmake/ECMConfig.cmake
)

ExternalProject_Get_property(extra-cmake-modules BINARY_DIR)
set(extra_cmake_modules_binary_dir ${BINARY_DIR})

set(wayland_protocols_source_dir ${third_party_loc}/wayland-protocols)
file(READ "${wayland_protocols_source_dir}/meson.build" wayland_protocols_meson_build)
string(REGEX MATCH "\n[ \t]*version: '([0-9.]+)'" _ ${wayland_protocols_meson_build})
set(wayland_protocols_version ${CMAKE_MATCH_1})
configure_file("wayland-protocols.pc.in" "${CMAKE_CURRENT_BINARY_DIR}/share/pkgconfig/wayland-protocols.pc" @ONLY)

ExternalProject_Add(plasma-wayland-protocols
    URL ${third_party_loc}/plasma-wayland-protocols
    CMAKE_GENERATOR Ninja
    CMAKE_ARGS
        -DCMAKE_BUILD_TYPE=Release
        -DCMAKE_INSTALL_PREFIX=<BINARY_DIR>
        -DCMAKE_INSTALL_LIBDIR=lib
        -DECM_DIR=${extra_cmake_modules_binary_dir}/share/ECM/cmake
    BUILD_COMMAND ${CMAKE_COMMAND} --build <BINARY_DIR>
    COMMAND ${CMAKE_COMMAND} --install <BINARY_DIR>
    STEP_TARGETS build
    EXCLUDE_FROM_ALL TRUE
    BUILD_BYPRODUCTS <BINARY_DIR>/lib/cmake/PlasmaWaylandProtocols/PlasmaWaylandProtocolsConfig.cmake
)

ExternalProject_Add_StepDependencies(plasma-wayland-protocols configure extra-cmake-modules-build)

ExternalProject_Get_property(plasma-wayland-protocols BINARY_DIR)
set(plasma_wayland_protocols_binary_dir ${BINARY_DIR})

ExternalProject_Add(kwayland
    URL ${third_party_loc}/kwayland
    CMAKE_GENERATOR Ninja
    CMAKE_COMMAND newcmake
    CMAKE_ARGS
        -DCMAKE_BUILD_TYPE=Release
        -DBUILD_SHARED_LIBS=OFF
        -DBUILD_TESTING=OFF
        -DBUILD_WITH_QT6=${DESKTOP_APP_QT6}
        -DEXCLUDE_DEPRECATED_BEFORE_AND_AT=5.91.0
        -DCMAKE_PREFIX_PATH=${CMAKE_PREFIX_PATH}:${MIX_T_DIR}:${CMAKE_CURRENT_BINARY_DIR}
        -DECM_DIR=${extra_cmake_modules_binary_dir}/share/ECM/cmake
        -DPlasmaWaylandProtocols_DIR=${plasma_wayland_protocols_binary_dir}/lib/cmake/PlasmaWaylandProtocols
    STEP_TARGETS build
    EXCLUDE_FROM_ALL TRUE
    BUILD_BYPRODUCTS <BINARY_DIR>/lib/libKF5WaylandClient.a
)

ExternalProject_Add_StepDependencies(kwayland configure extra-cmake-modules-build)
ExternalProject_Add_StepDependencies(kwayland configure plasma-wayland-protocols-build)

ExternalProject_Get_property(kwayland SOURCE_DIR)
ExternalProject_Get_property(kwayland BINARY_DIR)

file(MAKE_DIRECTORY "${SOURCE_DIR}/src/client")
file(MAKE_DIRECTORY "${BINARY_DIR}/src/client")

set_target_properties(external_kwayland_bundled PROPERTIES
    IMPORTED_LOCATION "${BINARY_DIR}/lib/libKF5WaylandClient.a"
)

target_include_directories(external_kwayland_bundled SYSTEM
INTERFACE
    ${SOURCE_DIR}/src/client
    ${BINARY_DIR}/src/client
)

target_link_libraries(external_kwayland_bundled
INTERFACE
    desktop-app::external_qt
)

if (DESKTOP_APP_USE_PACKAGED)
    find_package(PkgConfig REQUIRED)
    pkg_check_modules(WAYLAND_CLIENT REQUIRED IMPORTED_TARGET wayland-client)
    target_link_libraries(external_kwayland_bundled INTERFACE PkgConfig::WAYLAND_CLIENT)
else()
    target_link_libraries(external_kwayland_bundled INTERFACE desktop-app::linux_wayland_helper)
endif()

add_dependencies(external_kwayland_bundled kwayland-build)

target_link_libraries(external_kwayland
INTERFACE
    external_kwayland_bundled
)
