{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://download-fallback.gnome.org/sources/glib/2.70/glib-2.70.1.tar.xz
fb613d21fabce3d3d8520f37d12bd473
{% endblock %}

{% block lib_deps %}
lib/z
lib/pcre
lib/iconv
lib/ffi
lib/intl
{% if target.os == 'darwin' %}
lib/darwin/framework/CoreServices
lib/darwin/framework/Foundation
{% endif %}
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block std_box %}
{% if target.os == 'darwin' %}
dev/lang/cctools
{% endif %}
dev/build/meson
box/boot
{% endblock %}

{% block setup %}
export CXXFLAGS=
export CPPFLAGS="-D_GNU_SOURCE=1 -I${PWD}/inc ${CPPFLAGS}"
{% endblock %}

{% block meson_flags %}
-Diconv=external
-Dtests=false
{% endblock %}

{% block install %}
{{super()}}

{% if kind == 'lib' %}
find ${out}/ | grep '\.pc$' | while read i; do
    sed -e 's|.*bindir.*||' -i ${i}
done
{% endif %}
{% endblock %}
