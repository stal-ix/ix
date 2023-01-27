{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://www.freedesktop.org/software/fontconfig/release/fontconfig-2.14.2.tar.xz
sha:dba695b57bce15023d2ceedef82062c2b925e51f5d4cc4aef736cf13f60a468b
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
lib/freetype
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
