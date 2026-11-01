{% extends '//lib/ffmpeg/4/ix.sh' %}

# noauto

{% block pkg_name %}
ffmpeg
{% endblock %}

{% block version %}
7.1.5
{% endblock %}

{% block fetch %}
https://ffmpeg.org/releases/ffmpeg-{{self.version().strip()}}.tar.xz
de668509caf9e35e3cd162473441fdb29538c6d96ed080292b3cf9e6fc5d558f
{% endblock %}

{% block lib_deps %}
{% if vulkan %}
lib/vulkan/headers
lib/vulkan/loader
{% endif %}
{{super()}}
{% endblock %}
