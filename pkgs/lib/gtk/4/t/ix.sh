{% extends '//lib/gtk/t/ix.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gtk/-/archive/4.16.0/gtk-4.16.0.tar.bz2
sha:bc4132ba22b9b912d9bdb01bb6cd2af132f0c11301039671d20c32732afe397e
{% endblock %}

{% block lib_deps %}
{{super()}}
lib/vulkan/loader
{% endblock %}

{% block bld_tool %}
bin/glslc
bin/sassc
{{super()}}
{% endblock %}

{% block meson_flags %}
vulkan=enabled
x11-backend=false
build-demos=false
build-tests=false
build-examples=false
build-testsuite=false
media-gstreamer=disabled
{% endblock %}
