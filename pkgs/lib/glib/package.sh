{% extends '//mix/template/meson.sh' %}

{% block fetch %}
# url https://download-fallback.gnome.org/sources/glib/2.68/glib-2.68.4.tar.xz
# md5 07ba0e946bf6dcad36388675d2f2876f
{% endblock %}

{% block deps %}
# lib lib/z lib/pcre lib/iconv lib/ffi lib/intl
# lib {{'sys/framework/CoreServices sys/framework/Foundation' | darwin}}
# bld dev/build/meson env/std boot/final/env/tools
{% endblock %}

{% block cflags %}
gcc -c -o main.o -x c - << EOF

int main() {}
EOF

ar q libmain.a main.o

export LDFLAGS="-L${PWD} -lmain ${LDFLAGS}"
export CPPFLAGS="-w -D_GNU_SOURCE=1 -I${PWD}/inc ${CPPFLAGS}"
{% endblock %}

{% block patch %}
echo 'int main() {}' > glib/tests/cxx.cpp
echo 'int main() {}' > tests/cxx-test.cpp
{% endblock %}

{% block meson_flags %}
--libdir=${out}/lib
-Ddefault_library=static
-Diconv=external
{% endblock %}

{% block postinstall %}
rm -rf ${out}/bin
{% endblock %}
