{% extends '//die/c/make.sh' %}

{% block git_repo %}
https://github.com/WebAssembly/wasi-libc
{% endblock %}

{% block git_commit %}
bd950eb128bff337153de217b11270f948d04bb4
{% endblock %}

{% block git_sha %}
e2d37cc2224d295d83136860c26a06659b1cd157e046af5b2aa4d2eba27bdda5
{% endblock %}

{% block make_flags %}
CC=clang-16
AR=llvm-ar
NM=llvm-nm
EXTRA_CFLAGS="${EF}"
INSTALL_DIR=${out}
THREAD_MODEL=posix
{% endblock %}

{% block setup %}
export EF="${CFLAGS} ${CPPFLAGS} -O2 -DNDEBUG"
{% endblock %}

{% block patch %}
sed -e 's|finish: check-symbols||' -i Makefile
{% endblock %}

{% block build %}
mkdir -p build/wasm32-wasi
{{super()}}
mkdir -p sysroot/share
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
mv lib/wasm* nlib
rm -rf lib
mv nlib lib
cd lib
llvm-ar q libcrt.a *.o
rm *.o
{% endblock %}

{% block env %}
export CPPFLAGS="-isystem ${out}/include -D_WASI_EMULATED_SIGNAL -D_WASI_EMULATED_PROCESS_CLOCKS -D_WASI_EMULATED_MMAN \${CPPFLAGS}"
export LDFLAGS="-static \${LDFLAGS}"
{% endblock %}
