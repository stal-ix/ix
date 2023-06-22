{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/WebAssembly/wasi-libc/archive/5862047a555523a7647606d13dbfc25282453ed5.zip
sha:fbf9a5df348feddafc72933a1442f9348fd8cdd60042279c74db244d10672fea
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
