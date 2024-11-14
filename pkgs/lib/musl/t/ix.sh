{% extends '//die/c/configure.sh' %}

{% block fetch %}
{% include 'ver.sh' %}
{% endblock %}

{% block lib_deps %}
lib/build
lib/musl/env
{% endblock %}

{% block configure_script %}
./configure
{% endblock %}

{% block configure_flags %}
--target={{target.gnu.three}}
--host={{target.gnu.three}}
--build={{host.gnu.three}}
--enable-static
--disable-shared
{% endblock %}

{% block setup_target_flags %}
export PICFLAGS="-fno-pic -fno-pie"
export CPPFLAGS="${PICFLAGS} ${CPPFLAGS}"
{% endblock %}

{% block patch %}
cat << EOF > src/stdlib/dso_handle.c
void* __dso_handle = (void*)&__dso_handle;
EOF
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/lib
ar q libcrt.a crt1.o crti.o crtn.o
ranlib libcrt.a
{% endblock %}

{% block env %}
export CMFLAGS="-DLIBCXX_HAS_MUSL_LIBC=yes \${CMFLAGS}"
export CPPFLAGS="${PICFLAGS} -D_LARGEFILE64_SOURCE=1 -isystem ${out}/include \${CPPFLAGS}"
export LDFLAGS="-static \${LDFLAGS}"
{% endblock %}
