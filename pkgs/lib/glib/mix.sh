{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://download-fallback.gnome.org/sources/glib/2.70/glib-2.70.1.tar.xz
fb613d21fabce3d3d8520f37d12bd473
{% endblock %}

{% block lib_deps %}
lib/z/mix.sh
lib/pcre/mix.sh
lib/iconv/mix.sh
lib/ffi/mix.sh
lib/intl/mix.sh
{% if mix.platform.target.os == 'darwin' %}
sys/framework/CoreServices/mix.sh
sys/framework/Foundation/mix.sh
{% endif %}
{% endblock %}

{% block bld_deps %}
{{super()}}
env/std/0/mix.sh
{% endblock %}

{% block setup %}
clang -c -o main.o -x c - << EOF

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
