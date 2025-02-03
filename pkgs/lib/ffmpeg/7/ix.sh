{% extends '//lib/ffmpeg/4/ix.sh' %}

{% block fetch %}
https://ffmpeg.org/releases/ffmpeg-7.1.tar.xz
sha:40973d44970dbc83ef302b0609f2e74982be2d85916dd2ee7472d30678a7abe6
{% endblock %}

{% block lib_deps %}
lib/vulkan/headers
lib/vulkan/loader
{{super()}}
{% endblock %}
