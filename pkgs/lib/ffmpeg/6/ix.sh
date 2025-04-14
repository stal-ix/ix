{% extends '//lib/ffmpeg/4/ix.sh' %}

{% block pkg_name %}
ffmpeg
{% endblock %}

{% block version %}
6.1.2
{% endblock %}

{% block fetch %}
https://ffmpeg.org/releases/ffmpeg-{{self.version().strip()}}.tar.xz
sha:3b624649725ecdc565c903ca6643d41f33bd49239922e45c9b1442c63dca4e38
{% endblock %}

{% block lib_deps %}
lib/vulkan/headers
lib/vulkan/loader
{{super()}}
{% endblock %}

{% block patch %}
{{super()}}
(base64 -d | patch -p1) << EOF
{% include 'add-av_stream_get_first_dts-for-chromium.patch/base64' %}
EOF
{% endblock %}
