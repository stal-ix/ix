{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
fontconfig
{% endblock %}

{% block version %}
2.17.0
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/fontconfig/fontconfig/-/archive/{{self.version().strip()}}/fontconfig-{{self.version().strip()}}.tar.bz2
486c53e63c07cefd56ccd1234a665bc45fa2f37072c189ccb06373b97c7d73c2
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
