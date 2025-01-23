{% extends '//lib/mesa/drivers/base/ix.sh' %}

{% block meson_flags %}
{{super()}}
vulkan-drivers=
gallium-drivers=
{% endblock %}
