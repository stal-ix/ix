# url https://downloads.sourceforge.net/project/p7zip/p7zip/16.02/p7zip_16.02_src_all.tar.bz2
# md5 a0128d661cfe7cc8c121e73519c54fbf
# bld lib/cxx dev/build/make env/std

build() {
    $untar $src/p7zip* && cd p7zip*

    export CXXFLAGS="-std=c++03 $CXXFLAGS"

    setup_compiler

    make -j $make_thrs -f makefile \
        DEST_DIR=$out \
        CC=gcc \
        CXX=g++ \
        7za install

    (
        cd $out/usr/local/ && mv * $out/
        rm -rf $out/usr
    )

    mkdir $out/bin
    install bin/7za $out/bin/
}
