{% extends '//lib/gtk/t/ix.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gtk/-/archive/4.15.4/gtk-4.15.4.tar.bz2
sha:d586c2a12cfe0fd8f2e3305aafc61d60dca38a04fb70cc186904e22ab168c7a8
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
