{% extends '//lib/wlroots/14/mix.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/wlroots/wlroots/-/archive/0.15.0/wlroots-0.15.0.tar.bz2
sha:fcb9e9dbbb112f5c527c1c4155994fd97b6b1eb3950316e186e3c293e7a07fc4
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
