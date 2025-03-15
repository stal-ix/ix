{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/fontconfig/fontconfig/-/archive/2.16.1/fontconfig-2.16.1.tar.bz2
sha:9c5d60f2b66e70a621bd09a515adf6bf79d9dbe55bc8b005f3b841a451c24015
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

{% block meson_tool %}
bld/meson/6
{% endblock %}

{% block meson_flags %}
cache-build=disabled
default-fonts-dirs=
{% endblock %}

{% block patch %}
find . -type f -name '*.c' | while read l; do
    sed -e 's|.*/usr/share.*||' \
        -e 's|.*/usr/local/share.*||' \
        -i ${l}
done
{% endblock %}
