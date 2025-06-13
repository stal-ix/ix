{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
fontconfig
{% endblock %}

{% block version %}
2.16.2
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/fontconfig/fontconfig/-/archive/{{self.version().strip()}}/fontconfig-{{self.version().strip()}}.tar.bz2
fd9dfb5fe4d4503ae286e95fd85973c3c0490cf5d88ebf49e7f943973443262b
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
