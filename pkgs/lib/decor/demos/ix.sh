{% extends '//lib/decor/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/mesa/gl
lib/mesa/egl
lib/xkbcommon
lib/drivers/3d
{% endblock %}

{% block meson_strip_dirs %}
{% endblock %}

{% block patch %}
sed -e "s|'gl'|'opengl'|" -i demo/meson.build
{{super()}}
{% endblock %}

{% block install %}
mkdir ${out}/bin

find ${tmp} -type f -executable -name 'libdecor*' | while read l; do
    cp ${l} ${out}/bin/
done
{% endblock %}
