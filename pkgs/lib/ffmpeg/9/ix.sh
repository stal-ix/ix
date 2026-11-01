{% extends '//lib/ffmpeg/4/ix.sh' %}

# noauto

{% block pkg_name %}
ffmpeg
{% endblock %}

{% block version %}
9.0.2
{% endblock %}

{% block fetch %}
https://ffmpeg.org/releases/ffmpeg-{{self.version().strip()}}.tar.xz
8c3850283eb25fa026482078a04051e0be17347b09ef81a0849bec15a96e002e
{% endblock %}

{% block lib_deps %}
{% if vulkan %}
lib/vulkan/headers
lib/vulkan/loader
{% endif %}
{{super()}}
{% endblock %}
