{% extends '//lib/ffmpeg/4/ix.sh' %}

{% block fetch %}
https://ffmpeg.org/releases/ffmpeg-6.1.1.tar.xz
sha:8684f4b00f94b85461884c3719382f1261f0d9eb3d59640a1f4ac0873616f968
{% endblock %}

{% block lib_deps %}
lib/vulkan/headers
lib/vulkan/loader
{{super()}}
{% endblock %}
