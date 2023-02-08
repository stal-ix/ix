{% extends '//bin/transmission/t/ix.sh' %}

{% block bld_libs %}
lib/notify
lib/gtk/3/mm
lib/appindicator
lib/gdk/pixbuf/svg
{{super()}}
{% endblock %}

{% block cmake_flags %}
{{super()}}
ENABLE_GTK=ON
GLIB_COMPILE_RESOURCES_EXECUTABLE=glib-compile-resources
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block bld_tool %}
bld/glib
bld/gettext
{{super()}}
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
mv bin old
mkdir bin
mv old/transmission-gtk bin/
rm -r old
{% endblock %}
