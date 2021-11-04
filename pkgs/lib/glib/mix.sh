{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://download-fallback.gnome.org/sources/glib/2.68/glib-2.68.4.tar.xz
07ba0e946bf6dcad36388675d2f2876f
{% endblock %}

{% block lib_deps %}
lib/z/mix.sh
lib/pcre/mix.sh
lib/iconv/mix.sh
lib/ffi/mix.sh
lib/intl/mix.sh
{{'sys/framework/CoreServices/mix.sh sys/framework/Foundation/package.py' | darwin}}
{% endblock %}

{% block bld_deps %}
dev/build/meson/mix.sh
env/std/mix.sh
boot/final/env/tools/mix.sh
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
