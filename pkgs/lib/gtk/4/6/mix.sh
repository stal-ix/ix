{% extends '//lib/gtk/4/4/mix.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gtk/-/archive/4.6.0/gtk-4.6.0.tar.bz2
111bb032239203913f40d43eb7f661f9
{% endblock %}

{% block bld_tool %}
lib/sass/c
{{super()}}
{% endblock %}

{% block install %}
exit 1
{% endblock %}

{% block step_patch %}
find . -type f -name '*.wrap' -delete

find . -type f -name meson.build | while read l; do
# danger, Will Robinson!
cat ${l} \
| sed -e 's|shared_library|library|g' \
| sed -e 's|shared_module|library|g' \
> _ && mv _ ${l}
done
{% endblock %}
