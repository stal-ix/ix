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
2d6e6fcc8c2d285f22e18bafdd84b2250976e0d316f6662ed51f2b6401897bad
{% endblock %}

{% block bld_libs %}
{{super()}}
lib/placebo/6
{% endblock %}

{% block git_version %}
v3
{% endblock %}
