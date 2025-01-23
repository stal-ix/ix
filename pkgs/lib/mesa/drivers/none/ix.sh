{% extends '//lib/mesa/core/ix.sh' %}

{% block meson_flags %}
{{super()}}
vulkan-drivers=
gallium-drivers=
{% endblock %}
