{% extends '//lib/webkit/t/mix.sh' %}

{% block bld_libs %}
lib/mesa/gl
lib/mesa/egl
lib/drivers/3d
lib/glib/networking
lib/gstreamer/19/dl
{{super()}}
{% endblock %}

{% block install %}
{{super()}}

cd ${out}/bin

find ${out} -type f -executable | while read l; do
    mv "${l}" ./ || true
done

rm -rf jsc bin_*
{% endblock %}
