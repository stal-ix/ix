{% extends '//lib/mesa/t/mix.sh' %}

{% block meson_flags %}
{{super()}}
{% block mesa_drivers %}
dri-drivers=
vulkan-drivers=
gallium-drivers=
{% endblock %}
{% endblock %}

{% block patch %}
{{super()}}

sed -e 's|with_dri = .*|with_dri = true|'         \
    -e 's|with_any_vk = .*|with_any_vk = true|'   \
    -e 's|with_gallium = .*|with_gallium = true|' \
    -i meson.build
{% endblock %}
