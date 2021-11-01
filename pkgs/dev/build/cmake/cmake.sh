build_cmake_prepare() {
    export CPPFLAGS="-Wno-unused-command-line-argument ${CPPFLAGS}"
    export CXXFLAGS="${CPPFLAGS} ${CFLAGS} ${CXXFLAGS}"
    export CFLAGS="${CPPFLAGS} ${CONLYFLAGS} ${CFLAGS}"

    (rm -rf build || true) && mkdir build && cd build

    cmake \
        ${CMFLAGS}                                         \
        -Wno-dev                                           \
        -DCMAKE_INSTALL_PREFIX="${out}"                    \
        -DCMAKE_EXE_LINKER_FLAGS="${LDFLAGS}"              \
        -DCMAKE_C_COMPILER="$(command -v clang)"           \
        -DCMAKE_CXX_COMPILER="$(command -v clang++)"       \
        -DCMAKE_AR="$(command -v ar)"                      \
        -DCMAKE_RANLIB="$(command -v ranlib)"              \
        -DCMAKE_BUILD_TYPE=Release                         \
        -DCMAKE_C_FLAGS_RELEASE="${CFLAGS} ${LDFLAGS}"     \
        -DCMAKE_CXX_FLAGS_RELEASE="${CXXFLAGS} ${LDFLAGS}" \
        -DBUILD_SHARED_LIBS=OFF                            \
        -DCMAKE_PREFIX_PATH="${CMPATH}"                    \
        -DCMAKE_FIND_USE_CMAKE_SYSTEM_PATH=NO              \
        -DCMAKE_FIND_USE_SYSTEM_ENVIRONMENT_PATH=NO        \
        -DCMAKE_FIND_USE_SYSTEM_PACKAGE_REGISTRY=NO        \
        $@
}

build_cmake_ninja() (
    build_cmake_prepare -G Ninja $@
    ninja -j ${make_thrs} all
    ninja install
)
