{% extends '//mix/template/template.sh' %}

{% block fetch %}
https://github.com/pg83/mrustc/archive/refs/heads/master.zip
de37572dae52a8249bb3fabfb3f5532b
https://static.rust-lang.org/dist/rustc-1.29.0-src.tar.gz
54c3f0ffb826bdcc2a7395468828a94c
https://static.rust-lang.org/dist/rustc-1.19.0-src.tar.gz
75e779670ac79edf023497a9c37eb35d
{% endblock %}

{% block bld_deps %}
lib/z/mix.sh
lib/c++/mix.sh
lib/curl/mix.sh
lib/iconv/mix.sh
lib/openssl/mix.sh
tool/curl/mix.sh
shell/cli/bash/minimal/mix.sh
dev/vcs/git/mix.sh
gnu/tar/mix.sh
tool/gnu/time/mix.sh
dev/build/python/mix.sh
dev/build/make/mix.sh
dev/build/cmake/mix.sh
env/std/mix.sh
{% endblock %}

{% block unpack %}
{{super()}}
cp ${src}/rustc* ./
{% endblock %}

{% block setup %}
echo > empty.c
clang -c empty.c -o empty.o
ar q librt.a empty.o

cp librt.a libstdc++.a
cp librt.a libgcc_s.a

export LDFLAGS="-L${PWD} ${LDFLAGS}"
{% endblock %}

{% block patch %}
sed -e 's/VERSION_GIT.*/QW -DVERSION_BUILDTIME=\\"\\" -DVERSION_GIT_ISDIRTY=1 -DVERSION_GIT_FULLHASH=\\"\\" -DVERSION_GIT_SHORTHASH=\\"\\" -DVERSION_GIT_BRANCH=1 /' \
    -e 's/-Wl,--whole-archive/-Wl,-all_load/' \
    -e 's/-Wl,--no-whole-archive/-Wl,-noall_load/' \
    -i Makefile
{% endblock %}

{% block build %}
bash << EOF
set -e
set -x

echo '1.29.0' > rust-version

unset OPENSSL_LIBS
unset OPENSSL_INCLUDE
unset OPENSSL_INCLUDES

export ZLIB_LIBRARY="$lib_z/lib/libz.a"
export ZLIB_INCLUDE_DIR="$lib_z/include"
export DEP_Z_INCLUDE="$lib_z/include"
export DEP_Z_ROOT="$lib_z"
export DEP_OPENSSL_ROOT="$lib_openssl"
export DEP_OPENSSL_INCLUDE="$lib_openssl/include"

make RUSTCSRC
make V= CC=$(command -v clang) RUSTC_TARGET={{mix.platform.target.arch}}-apple-darwin -j ${make_thrs} -f minicargo.mk || true
make V= CC=$(command -v clang) RUSTC_TARGET={{mix.platform.target.arch}}-apple-darwin -j ${make_thrs} -f minicargo.mk
make V= CC=$(command -v clang) RUSTC_TARGET={{mix.platform.target.arch}}-apple-darwin -C run_rustc

exit 1
EOF
{% endblock %}
