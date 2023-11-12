{% extends '//lib/ffmpeg/4/ix.sh' %}

{% block fetch %}
https://ffmpeg.org/releases/ffmpeg-6.1.tar.xz
sha:488c76e57dd9b3bee901f71d5c95eaf1db4a5a31fe46a28654e837144207c270
{% endblock %}

{% block lib_deps %}
lib/vulkan/headers
lib/vulkan/loader
{{super()}}
{% endblock %}
