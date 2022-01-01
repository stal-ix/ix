{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/glib/-/archive/2.71.0/glib-2.71.0.tar.bz2
bb73dd817634018cb45f91647948fb2e
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/ffi
lib/intl
lib/pcre
lib/iconv
{% if target.os == 'darwin' %}
lib/darwin/framework/CoreServices
lib/darwin/framework/Foundation
{% endif %}
{% endblock %}

{% block std_box %}
{% if target.os == 'darwin' %}
dev/lang/cctools
{% endif %}
dev/build/meson
box/boot
{% endblock %}

{% block setup %}
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
