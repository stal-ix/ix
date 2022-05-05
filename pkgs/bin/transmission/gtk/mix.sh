{% extends '//bin/transmission/t/mix.sh' %}

{% block bld_libs %}
lib/gtk/3
lib/notify
lib/rsvg/dl
lib/appindicator
{{super()}}
{% endblock %}

{% block cmake_flags %}
{{super()}}
ENABLE_GTK=ON
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block bld_tool %}
bld/gettext
bld/glib/codegen
{{super()}}
{% endblock %}

{% block patch %}
sed -e 's|.*glib-compile-resources executable.*|SET(GLIB_COMPILE_RESOURCES_EXECUTABLE glib-compile-resources)|' -i gtk/CMakeLists.txt
cd po
cp pt.po pt_PT.po
{% endblock %}

{% block install %}
{{super()}}
{{hooks.wrap_xdg_binary('transmission-gtk')}}
{% endblock %}
