{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/glib/-/archive/2.71.0/glib-2.71.0.tar.bz2
bb73dd817634018cb45f91647948fb2e
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/ffi
{% if bin %}
lib/intl
{% endif %}
lib/pcre
lib/iconv
{% if target.os == 'darwin' %}
lib/darwin/framework/CoreServices
lib/darwin/framework/Foundation
{% endif %}
{% endblock %}

{% block std_box %}
{% if target.os == 'darwin' %}
bin/cctools
{% endif %}
bin/meson
bld/bootbox
{% endblock %}

{% block cpp_defines %}
_GNU_SOURCE=1
{% endblock %}

{% block setup %}
export CPPFLAGS="-I${PWD}/inc ${CPPFLAGS}"
{% endblock %}

{% block meson_flags %}
iconv=external
tests=false
{% endblock %}

{% block install %}
{{super()}}

{% if lib %}
find ${out}/ | grep '\.pc$' | while read i; do
    sed -e 's|.*bindir.*||' -i ${i}
done
{% endif %}
{% endblock %}

{% block patch %}
patch -p5 << EOF
{% include '00.diff' %}
EOF

patch -p1 << EOF
{% include '01.diff' %}
EOF
{% endblock %}
