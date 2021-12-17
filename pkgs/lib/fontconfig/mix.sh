{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://www.freedesktop.org/software/fontconfig/release/fontconfig-2.13.94.tar.xz
ab06ff17524de3f1ddd3c97ed8a02f8d
{% endblock %}

{% block bld_tool %}
gnu/gettext/mix.sh
dev/tool/gperf/mix.sh
dev/tool/python/mix.sh
{% endblock %}

{% block lib_deps %}
lib/c/mix.sh
lib/intl/mix.sh
lib/iconv/mix.sh
lib/expat/mix.sh
lib/json/c/mix.sh
lib/freetype/mix.sh
{% endblock %}

{% block run_data %}
{% if kind != 'dat' %}
lib/fontconfig/mix.sh
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

{% block test %}
echo 'FIXME'
{% endblock %}
