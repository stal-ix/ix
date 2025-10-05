{% extends '//lib/gtk/t/ix.sh' %}

{% include 'ver.sh' %}

{% block lib_deps %}
{{super()}}
lib/drm
lib/rsvg
lib/vulkan/loader
{% endblock %}

{% block bld_tool %}
bin/glslc
bin/sassc
{{super()}}
{% endblock %}

{% block meson_tool %}
bld/meson/6
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
