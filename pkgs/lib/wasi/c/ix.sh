{% extends '//die/c/make.sh' %}

{% block git_repo %}
https://github.com/WebAssembly/wasi-libc
{% endblock %}

{% block git_branch %}
main
{% endblock %}

{% block git_commit %}
7018e24d8fe248596819d2e884761676f3542a04
{% endblock %}

{% block git_sha %}
64011d5d56d5ae2ced98270a1c6f56833f11de230d0f393ac73c3b2bf4d0fabb
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
export CPPFLAGS="-isystem ${out}/include \${CPPFLAGS}"
export LDFLAGS="-static \${LDFLAGS}"
{% endblock %}
