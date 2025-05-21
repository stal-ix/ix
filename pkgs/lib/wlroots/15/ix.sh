{% extends '//lib/wlroots/14/ix.sh' %}

{% block pkg_name %}
wlroots
{% endblock %}

{% block version %}
0.15.1
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/wlroots/wlroots/-/archive/{{self.version().strip()}}/wlroots-{{self.version().strip()}}.tar.bz2
sha:8bb791aed9405abc20253c570de1a3b7af91ad65bee2b60293fbbab27ea62c8d
{% endblock %}

{% block lib_deps %}
{{super()}}
{% if vulkan %}
lib/vulkan/loader
lib/vulkan/headers
{% endif %}
{% endblock %}

{% block bld_tool %}
{{super()}}
{% if vulkan %}
bin/glslang
{% endif %}
{% endblock %}

{% block patch %}
{% if vulkan %}
sed -e 's|unsigned layer_count.*|unsigned layer_count = 0;|' -i render/vulkan/vulkan.c
{% endif %}
{{super()}}
{% endblock %}

{% block meson_flags %}
# yeah, baby
backends=drm,libinput
{% endblock %}
