{% extends '//lib/ffmpeg/6/ix.sh' %}

{% block fetch %}
{% endblock %}

{% block git_repo %}
https://github.com/FFmpeg/FFmpeg
{% endblock %}

{% block git_commit %}
a9205620b19e0c25cf9f6165b0b3937edf9ce62e
{% endblock %}

{% block git_sha %}
b676c7be6a38182cb5144f3ab70373e2698e6c9dde467f76d44623927a52b4b8
{% endblock %}

{% block bld_libs %}
{{super()}}
lib/placebo/6
{% endblock %}
