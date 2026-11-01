{% extends '//lib/ffmpeg/4/ix.sh' %}

# noauto

{% block pkg_name %}
ffmpeg
{% endblock %}

{% block version %}
6.1.6
{% endblock %}

{% block fetch %}
https://ffmpeg.org/releases/ffmpeg-{{self.version().strip()}}.tar.xz
d4fcb164028dd3beee5d92c0ac72e46aac6973c75ea12dc14de07bf8f407370a
{% endblock %}

{% block lib_deps %}
{% if vulkan %}
lib/vulkan/headers
lib/vulkan/loader
{% endif %}
{{super()}}
{% endblock %}

{% block patch %}
{{super()}}
(base64 -d | patch -p1) << EOF
{% include 'add-av_stream_get_first_dts-for-chromium.patch/base64' %}
EOF
{% endblock %}
