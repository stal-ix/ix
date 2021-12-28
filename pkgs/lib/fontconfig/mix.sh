{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://www.freedesktop.org/software/fontconfig/release/fontconfig-2.13.94.tar.xz
ab06ff17524de3f1ddd3c97ed8a02f8d
{% endblock %}

{% block bld_tool %}
gnu/gettext
dev/tool/gperf
dev/tool/python
{% endblock %}

{% block lib_deps %}
lib/c
lib/intl
lib/iconv
lib/expat
lib/json/c
lib/freetype
{% endblock %}

{% block run_data %}
{% if kind != 'dat' %}
lib/fontconfig
{% endif %}
{% endblock %}

{% block patch %}
cd fc-cache

cat meson.build \
    | grep -v 'add_install_script' \
    > _ && mv _ meson.build
{% endblock %}

{% block configure %}
{{super()}}

{% if kind != 'dat' %}
sed -e "s|$(basename ${out})|$(basename ${D_lib_fontconfig})|" \
    -i ${tmp}/obj/config.h
{% endif %}
{% endblock %}

{% block install %}
{{super()}}
rm -rf ${out}/var
{% if kind != 'dat' %}
# ensure it will not be used
rm -rf ${out}/share
{% endif %}
{% endblock %}
