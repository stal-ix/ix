{% extends '//die/c/make.sh' %}

{% block git_repo %}
https://github.com/WebAssembly/wasi-libc
{% endblock %}

{% block git_branch %}
wasi-sdk-25
{% endblock %}

{% block git_sha %}
4fad94464caa6fe4c78e599013eda224112999d6818ace32026b6da3ab636795
{% endblock %}

{% block bld_tool %}
bld/bash
{% endblock %}

{% block make_flags %}
CC=${FREESTANDING_CLANG}
AR=llvm-ar
NM=llvm-nm
EXTRA_CFLAGS="${EF}"
INSTALL_DIR=${out}
THREAD_MODEL=posix
{% endblock %}

{% block setup_target_flags %}
export EF="${CFLAGS} ${CPPFLAGS} -O2 -DNDEBUG"
{% endblock %}

{% block patch %}
sed -e 's|finish: check-symbols||' -i Makefile
{% endblock %}

{% block build %}
mkdir -p build/wasm32-wasi-threads
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
export CPPFLAGS="-isystem ${out}/include/wasm32-wasi-threads -D_WASI_EMULATED_SIGNAL -D_WASI_EMULATED_PROCESS_CLOCKS -D_WASI_EMULATED_MMAN -D_WASI_EMULATED_PTHREAD \${CPPFLAGS}"
export LDFLAGS="-static \${LDFLAGS}"
{% endblock %}
