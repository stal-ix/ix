{% extends '//lib/wlroots/14/mix.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/wlroots/wlroots/-/archive/0.15.1/wlroots-0.15.1.tar.bz2
sha:8bb791aed9405abc20253c570de1a3b7af91ad65bee2b60293fbbab27ea62c8d
{% endblock %}

{% block lib_deps %}
{{super()}}
lib/vulkan/loader
lib/vulkan/headers
{% endblock %}

{% block bld_tool %}
{{super()}}
bin/glslang
{% endblock %}

{% block patch %}
sed -e 's|unsigned layer_count.*|unsigned layer_count = 0;|' -i render/vulkan/vulkan.c
{{super()}}
{% endblock %}

{% block meson_flags %}
# yeah, baby
{{super().strip()}},vulkan
backends=drm,libinput
{% endblock %}
