{% extends '//lib/gtk/t/ix.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gtk/-/archive/4.16.1/gtk-4.16.1.tar.bz2
sha:d1af07d60d585f20384df36874fbc4d462660b7800b32709c888508b096addb6
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
