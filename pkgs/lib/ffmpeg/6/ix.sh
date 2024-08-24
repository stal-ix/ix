{% extends '//lib/ffmpeg/4/ix.sh' %}

{% block fetch %}
https://ffmpeg.org/releases/ffmpeg-6.1.2.tar.xz
sha:3b624649725ecdc565c903ca6643d41f33bd49239922e45c9b1442c63dca4e38
{% endblock %}

{% block lib_deps %}
lib/vulkan/headers
lib/vulkan/loader
{{super()}}
{% endblock %}
