{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://www.freedesktop.org/software/fontconfig/release/fontconfig-2.13.94.tar.xz
sha:a5f052cb73fd479ffb7b697980510903b563bbb55b8f7a2b001fcfb94026003c
{% endblock %}

{% block bld_tool %}
bld/gettext
bin/gperf
bld/python
{% endblock %}

{% block lib_deps %}
lib/c
lib/expat
lib/json/c
lib/freetype
{% endblock %}

{% block patch %}
sed -e 's|.*fc_fonts_path = .*usr.*share.*|fc_fonts_path = []|' -i meson.build
sed -e 's|.*add_install_script.*||' -i fc-cache/meson.build

find . -type f -name '*.c' | while read l; do
    sed -e 's|.*/usr/share.*||' \
        -e 's|.*/usr/local/share.*||' \
        -i ${l}
done
{% endblock %}
