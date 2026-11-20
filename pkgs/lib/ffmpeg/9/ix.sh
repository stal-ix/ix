{% extends '//lib/ffmpeg/4/ix.sh' %}

# noauto

{% block pkg_name %}
ffmpeg
{% endblock %}

{% block version %}
9.1
{% endblock %}

{% block fetch %}
https://ffmpeg.org/releases/ffmpeg-{{self.version().strip()}}.tar.xz
1a4d394ae63d190a526cd052eb4415c156b5c5e2df37efab41a7de0b8fde2433
{% endblock %}

{% block lib_deps %}
{% if vulkan %}
lib/vulkan/headers
lib/vulkan/loader
{% endif %}
{{super()}}
{% endblock %}
