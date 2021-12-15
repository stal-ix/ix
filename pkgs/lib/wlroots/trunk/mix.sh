{% extends '//lib/wlroots/14/mix.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/wlroots/wlroots/-/archive/0fcc842291d9d714e9c210839ae72429c5c3eae4/wlroots-0fcc842291d9d714e9c210839ae72429c5c3eae4.tar.bz2
575a79e19cc4f6c66317bdaf86e93b9c
{% endblock %}

{% block lib_deps %}
lib/c/mix.sh
{{super()}}
lib/vulkan/loader/mix.sh
lib/vulkan/headers/mix.sh
lib/vulkan/glslang/mix.sh
{% endblock %}

{% block bld_tool %}
{{super()}}
lib/vulkan/glslang/mix.sh
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
