# url https://nav.dl.sourceforge.net/project/sbcl/sbcl/2.1.7/sbcl-2.1.7-source.tar.bz2
# md5 3f21dbcab14b4aa51b9a9f03c2b78b9c
# bld lib/z
# bld dev/lang/ecl dev/build/make env/std

build() {
    $untar $src/sbcl* && cd sbcl*

    (
        mkdir xxx && cd xxx
        cp $(which dash) sh
        setup_compiler
        rm gcc g++
        cp clang gcc
        cp clang++ g++
        cp clang cc
    )

    sed -e 's/lispobj \*static_code_space_free_pointer/extern lispobj \*static_code_space_free_pointer/' -i src/runtime/globals.h
    sed -e 's/size_t os_vm_page_size/extern size_t os_vm_page_size/' -i src/runtime/arm64-bsd-os.c

    export PATH="$(pwd)/xxx:$PATH"

    ulimit -s 60000

    dash ./make.sh \
        --xc-host='ecl -norc' \
        --prefix=$out \
        --with-sb-ldb \
        --with-sb-thread \
        --with-sb-core-compression \
        --without-avx2 \
        --without-sse

    dash ./install.sh
}
