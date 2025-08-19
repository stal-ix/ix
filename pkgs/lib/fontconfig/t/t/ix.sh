{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
fontconfig
{% endblock %}

{% block version %}
2.17.1
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/fontconfig/fontconfig/-/archive/{{self.version().strip()}}/fontconfig-{{self.version().strip()}}.tar.bz2
bc1a90697eb8ec6c3eed118105ef9cbdfdd676e563905bf1cb571a705598300e
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
