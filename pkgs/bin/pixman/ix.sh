{% extends '//lib/pixman/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/png
lib/glib
lib/gtk/3
{% endblock %}

{% block meson_flags %}
{{super()}}
demos=enabled
{% endblock %}

{% block meson_strip_dirs %}
{% endblock %}

{% block install %}
mkdir ${out}/bin
find ${tmp}/obj/demos/ -executable | while read l; do
    test -f ${l} && cp ${l} ${out}/bin/
done
{% endblock %}
