$unzip ${src}/*.zip && cd mrust* && cp ${src}/rustc* ./

echo > empty.c
gcc -c empty.c -o empty.o
ar q librt.a empty.o

cp librt.a libstdc++.a
cp librt.a libgcc_s.a

export LDFLAGS="-L$(pwd) $LDFLAGS"

setup_compiler

echo > ps && chmod +x ps
ln -s $(which bash) sh
ln -s gcc cc
ls -la

echo '1.29.0' > rust-version

sed -e 's/VERSION_GIT.*/QW -DVERSION_BUILDTIME=\\"\\" -DVERSION_GIT_ISDIRTY=1 -DVERSION_GIT_FULLHASH=\\"\\" -DVERSION_GIT_SHORTHASH=\\"\\" -DVERSION_GIT_BRANCH=1 /' \
    -e 's/-Wl,--whole-archive/-Wl,-all_load/' \
    -e 's/-Wl,--no-whole-archive/-Wl,-noall_load/' \
    -i Makefile

unset OPENSSL_LIBS
unset OPENSSL_INCLUDE
unset OPENSSL_INCLUDES

export ZLIB_LIBRARY="$lib_z/lib/libz.a"
export ZLIB_INCLUDE_DIR="$lib_z/include"
export DEP_Z_INCLUDE="$lib_z/include"
export DEP_Z_ROOT="$lib_z"
export DEP_OPENSSL_ROOT="$lib_openssl"
export DEP_OPENSSL_INCLUDE="$lib_openssl/include"

bash << EOF
set -e
set -x

make RUSTCSRC
make V= CC=$(which clang) RUSTC_TARGET={{mix.platform.target.arch}}-apple-darwin -j ${make_thrs} -f minicargo.mk || true
make V= CC=$(which clang) RUSTC_TARGET={{mix.platform.target.arch}}-apple-darwin -j ${make_thrs} -f minicargo.mk
make V= CC=$(which clang) RUSTC_TARGET={{mix.platform.target.arch}}-apple-darwin -C run_rustc

exit 1
EOF
