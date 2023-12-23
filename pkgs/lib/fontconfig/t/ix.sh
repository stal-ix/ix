{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://www.freedesktop.org/software/fontconfig/release/fontconfig-2.15.0.tar.xz
sha:63a0658d0e06e0fa886106452b58ef04f21f58202ea02a94c39de0d3335d7c0e
{% endblock %}

{% block bld_tool %}
bin/gperf
bld/python
bld/gettext
{% endblock %}

{% block lib_deps %}
lib/c
lib/expat
lib/json/c
{% endblock %}

{% block meson_flags %}
cache-build=disabled
default-fonts-dirs=no
{% endblock %}

{% block patch %}
find . -type f -name '*.c' | while read l; do
    sed -e 's|.*/usr/share.*||' \
        -e 's|.*/usr/local/share.*||' \
        -i ${l}
done
{% endblock %}
