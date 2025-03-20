{% extends '//lib/pixman/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/png
lib/glib
lib/gtk/3
{% endblock %}

{% block build_flags %}
{{super()}}
shut_up
{% endblock %}

{% block meson_flags %}
{{super()}}
tests=disabled
demos=enabled
{% endblock %}

{% block meson_strip_dirs %}
{% endblock %}

{% block install %}
mkdir ${out}/bin
find ${tmp}/obj/demos/ -type f -executable | while read l; do
    cp ${l} ${out}/bin/
done
{% endblock %}
