{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://www.freedesktop.org/software/fontconfig/release/fontconfig-2.13.94.tar.xz
ab06ff17524de3f1ddd3c97ed8a02f8d
{% endblock %}

{% block bld_tool %}
bin/gettext
bld/gperf
bld/python
{% endblock %}

{% block lib_deps %}
lib/c
lib/intl
lib/iconv
lib/expat
lib/json/c
lib/freetype
{% endblock %}

{% block patch %}
cd fc-cache

cat meson.build \
    | grep -v 'add_install_script' \
    > _ && mv _ meson.build
{% endblock %}
