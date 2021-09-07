# url https://archive.apache.org/dist/xerces/c/3/sources/xerces-c-3.2.3.tar.gz
# md5 a5fa4d920fce31c9ca3bfef241644494
# lib lib/cxx lib/curl lib/iconv
# dep dev/build/cmake env/std

build() {
    $untar $src/xerces* && cd xerces*

    export CPPFLAGS="-Dstricmp=xerces_stricmp -Dstrnicmp=xerces_strnicmp $CPPFLAGS"

    build_cmake_ninja \
        -DBUILD_SHARED_LIBS=OFF \
        -Dnetwork-accessor=curl \
        -Dtranscoder=iconv \
        -Dmessage-loader=inmemory \
        -Dmutex-manager=standard \
        ..

    cat << EOF > $out/env
export CPPFLAGS="-I$out/include \$CPPFLAGS"
export LDFLAGS="-L$out/lib -lxerces-c \$LDFLAGS"
export PKG_CONFIG_PATH="$out/lib/pkgconfig:\$PKG_CONFIG_PATH"
export CMFLAGS="-DXERCESC_INCLUDE_DIR=$out/include \$CMFLAGS"
EOF
}
