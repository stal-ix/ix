cmake_minimum_required (VERSION 3.16)

# KDE Application Version, managed by release script
set(RELEASE_SERVICE_VERSION_MAJOR "24")
set(RELEASE_SERVICE_VERSION_MINOR "07")
set(RELEASE_SERVICE_VERSION_MICRO "70")
set(KCACHEGRIND_VERSION ${RELEASE_SERVICE_VERSION_MAJOR}.${RELEASE_SERVICE_VERSION_MINOR}.${RELEASE_SERVICE_VERSION_MICRO})

project(kcachegrind VERSION ${KCACHEGRIND_VERSION})

# minimal requirements
set (QT_MIN_VERSION "6.5.0")
set (KF_MIN_VERSION "6.0.0")
# TODO move the code to work on newer compiler settings
set (KDE_COMPILERSETTINGS_LEVEL "5.84.0")

find_package(ECM ${KF_MIN_VERSION} REQUIRED NO_MODULE)
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${ECM_MODULE_PATH})

include(KDEInstallDirs)
include(KDECMakeSettings)
include(KDECompilerSettings NO_POLICY_SCOPE)
include(ECMInstallIcons)
include(FeatureSummary)
include(ECMAddAppIcon)
include(ECMPoQmTools)

find_package(Qt6 ${QT_MIN_VERSION} CONFIG REQUIRED Core DBus Gui Widgets)

add_definitions(
    -DQT_DEPRECATED_WARNINGS
    -DQT_USE_QSTRINGBUILDER
    -DQT_NO_CAST_TO_ASCII
    -DQT_NO_URL_CAST_FROM_STRING
    -DQT_NO_SIGNALS_SLOTS_KEYWORDS
)

configure_file(${CMAKE_CURRENT_SOURCE_DIR}/version.h.in ${CMAKE_CURRENT_BINARY_DIR}/version.h )

add_subdirectory( libcore )
add_subdirectory( libviews )
add_subdirectory( qcachegrind )
