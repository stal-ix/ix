{% extends '//lib/ffmpeg/4/ix.sh' %}

# noauto

{% block pkg_name %}
ffmpeg
{% endblock %}

{% block version %}
8.1.3
{% endblock %}

{% block fetch %}
https://ffmpeg.org/releases/ffmpeg-{{self.version().strip()}}.tar.xz
7138d28c96d9d3e3af4ee3d8cad72741f8ffb40da90c1112235dea3ecd3178a3
{% endblock %}

{% block lib_deps %}
{% if vulkan %}
lib/vulkan/headers
lib/vulkan/loader
{% endif %}
{{super()}}
{% endblock %}
