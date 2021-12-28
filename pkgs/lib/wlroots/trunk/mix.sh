{% extends '//lib/wlroots/14/mix.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/wlroots/wlroots/-/archive/812951f5bc47f502429406e49f4e24f377b7799b/wlroots-812951f5bc47f502429406e49f4e24f377b7799b.tar.bz2
e457d756979875b7a56481f1fffa1b71
{% endblock %}

{% block lib_deps %}
lib/c
{{super()}}
lib/vulkan/loader
lib/vulkan/headers
lib/vulkan/glslang
{% endblock %}

{% block bld_tool %}
{{super()}}
lib/vulkan/glslang
{% endblock %}

{% block patch %}
sed -e 's|unsigned layer_count.*|unsigned layer_count = 0;|' -i render/vulkan/vulkan.c
{{super()}}
{% endblock %}

{% block meson_flags %}
# yeah, baby
{{super().strip()}},vulkan
-Dbackends=drm,libinput
{% endblock %}
