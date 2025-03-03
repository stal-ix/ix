{% extends '//lib/ffmpeg/4/ix.sh' %}

{% block fetch %}
https://ffmpeg.org/releases/ffmpeg-7.1.1.tar.xz
sha:733984395e0dbbe5c046abda2dc49a5544e7e0e1e2366bba849222ae9e3a03b1
{% endblock %}

{% block lib_deps %}
lib/vulkan/headers
lib/vulkan/loader
{{super()}}
{% endblock %}
