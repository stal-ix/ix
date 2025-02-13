cmake_minimum_required(VERSION 3.14 FATAL_ERROR)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

project(libunicode VERSION "0.6.0" LANGUAGES CXX)

set(MASTER_PROJECT OFF)
if(${CMAKE_CURRENT_SOURCE_DIR} STREQUAL ${CMAKE_SOURCE_DIR})
    set(MASTER_PROJECT ON)
endif()

if(MASTER_PROJECT AND NOT WIN32)
    set(LIBUNICODE_BUILD_STATIC_DEFAULT OFF)
else()
    set(LIBUNICODE_BUILD_STATIC_DEFAULT ON)
endif()

# setting defaults
if (NOT("${CMAKE_CXX_STANDARD}"))
    set(CMAKE_CXX_STANDARD 20)
endif()
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set(CMAKE_COLOR_DIAGNOSTICS ON)

if(("${CMAKE_CXX_COMPILER_ID}" MATCHES "GNU") OR ("${CMAKE_CXX_COMPILER_ID}" MATCHES "Clang"))
    add_compile_options(-Wall)
    add_compile_options(-Wextra)
    if(NOT ${CMAKE_BUILD_TYPE} STREQUAL "Release")
        add_definitions(-D_GLIBCXX_DEBUG)
    endif()
elseif(DEFINED MSVC)
    add_definitions(-DNOMINMAX)
    add_compile_options(/utf-8)
endif()

include(EnableCcache)
include(ClangTidy)
include(PedanticCompiler)

set(CMAKE_EXPORT_COMPILE_COMMANDS ${MASTER_PROJECT})
option(LIBUNICODE_COVERAGE "libunicode: Builds with codecov [default: OFF]" OFF)
option(LIBUNICODE_EXAMPLES "libunicode: Enables building of example programs. [default: ${MASTER_PROJECT}]" ${MASTER_PROJECT})
option(LIBUNICODE_TESTING "libunicode: Enables building of unittests for libunicode [default: ${MASTER_PROJECT}" ${MASTER_PROJECT})
option(LIBUNICODE_BENCHMARK "libunicode: Enables building of benchmark for libunicode [default: OFF]" OFF)
option(LIBUNICODE_TOOLS "libunicode: Builds CLI tools [default: ${MASTER_PROJECT}]" ${MASTER_PROJECT})
option(LIBUNICODE_BUILD_STATIC "libunicode: provide static library instead of dynamic [default: ${LIBUNICODE_BUILD_STATIC_DEFAULT}]" ${LIBUNICODE_BUILD_STATIC_DEFAULT})
option(LIBUNICODE_TABLEGEN_FASTBUILD "libunicode: Use fast table generation (takes more memory in final tables) [default: OFF]" OFF)

if(NOT LIBUNICODE_SIMD_IMPLEMENTATION)
    set(LIBUNICODE_SIMD_IMPLEMENTATION "intrinsics" CACHE STRING "libunicode: SIMD implementation to use" FORCE)
    set_property(CACHE LIBUNICODE_SIMD_IMPLEMENTATION PROPERTY STRINGS "std" "intrinsics" "none")
endif()

set(BENCHMARK_ENABLE_TESTING OFF CACHE BOOL "Enable testing of the benchmark library." FORCE)
include(ThirdParties)

if(LIBUNICODE_TESTING)
    enable_testing()
endif()

# ----------------------------------------------------------------------------
set(LIBUNICODE_UCD_VERSION "16.0.0" CACHE STRING "libunicode: Unicode version")
set(LIBUNICODE_UCD_BASE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/_ucd" CACHE PATH "Path to directory for downloaded files & extracted directories.")

set(LIBUNICODE_UCD_ZIP_DOWNLOAD_URL "https://www.unicode.org/Public/${LIBUNICODE_UCD_VERSION}/ucd/UCD.zip")
set(LIBUNICODE_UCD_MD5 "bdd823cbd37c376633d6737a12281233")
set(LIBUNICODE_UCD_ZIP_FILE "${LIBUNICODE_UCD_BASE_DIR}/ucd-${LIBUNICODE_UCD_VERSION}.zip")
set(LIBUNICODE_UCD_DIR "${LIBUNICODE_UCD_BASE_DIR}/ucd-${LIBUNICODE_UCD_VERSION}" CACHE PATH "Path to UCD directory.")

# ----------------------------------------------------------------------------
# code coverage

if(LIBUNICODE_COVERAGE AND NOT MSVC)
    add_compile_options(-g --coverage)
    set(CMAKE_EXE_LINKER_FLAGS "--coverage ${CMAKE_EXE_LINKER_FLAGS}")
    message("-- [code coverage] Enabled.")
else()
    message("-- [code coverage] Disabled.")
endif()

# ----------------------------------------------------------------------------

add_subdirectory(src/libunicode)
add_subdirectory(src/tools)

if("${CCACHE}" STREQUAL "")
    set(USING_CCACHE_STRING "OFF")
else()
    set(USING_CCACHE_STRING "${CCACHE}")
endif()

if(LIBUNICODE_BUILD_STATIC)
    set(LIBUNICODE_BUILD_MODE "static")
else()
    set(LIBUNICODE_BUILD_MODE "dynamic")
endif()

# Export the cmake package to the cmake package registry (~/.cmake/packages/)
export(PACKAGE libunicode)

message(STATUS "------------------------------------------------------------------------------")
message(STATUS "    libunicode (version ${libunicode_VERSION}${libunicode_VERSION_SUFFIX})")
message(STATUS "------------------------------------------------------------------------------")
message(STATUS "Build type:                  ${CMAKE_BUILD_TYPE}")
message(STATUS "Build mode:                  ${LIBUNICODE_BUILD_MODE}")
message(STATUS "Build unit tests:            ${LIBUNICODE_TESTING}")
message(STATUS "Build benchmark:             ${LIBUNICODE_BENCHMARK}")
message(STATUS "Build tools:                 ${LIBUNICODE_TOOLS}")
message(STATUS "Enable tablegen fast build:  ${LIBUNICODE_TABLEGEN_FASTBUILD}")
message(STATUS "Using ccache:                ${USING_CCACHE_STRING}")
message(STATUS "SIMD support:                ${LIBUNICODE_SIMD_IMPLEMENTATION}")
message(STATUS "Using UCD directory:         ${LIBUNICODE_UCD_DIR}")
message(STATUS "Enable clang-tidy:           ${ENABLE_TIDY} (${CMAKE_CXX_CLANG_TIDY})")
message(STATUS "------------------------------------------------------------------------------")

ThirdPartiesSummary2()
