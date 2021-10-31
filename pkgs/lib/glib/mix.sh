{% extends '//mix/template/meson.sh' %}

{% block fetch %}
# url https://download-fallback.gnome.org/sources/glib/2.68/glib-2.68.4.tar.xz
# md5 07ba0e946bf6dcad36388675d2f2876f
{% endblock %}

{% block deps %}
# lib lib/z/mix.sh
# lib lib/pcre/mix.sh
# lib lib/iconv/mix.sh
# lib lib/ffi/mix.sh
# lib lib/intl/mix.sh
# lib {{'sys/framework/CoreServices/package.py sys/framework/Foundation/package.py' | darwin}}
# bld dev/build/meson/mix.sh
# bld env/std/mix.sh
# bld boot/final/env/tools/mix.sh
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
