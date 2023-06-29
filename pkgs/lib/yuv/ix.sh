{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://chromium.googlesource.com/libyuv/libyuv
{% endblock %}

{% block git_commit %}
a34a0ba68781d0d1914597449d871775dad50984
{% endblock %}

{% block git_sha %}
69a429c049368e7756fcaeff66efa1ce9c2a057a38bd737b26726dfeaa8fb656
{% endblock %}

{% block lib_deps %}
lib/c
lib/jpeg
{% endblock %}

{% block bld_tool %}
bld/genpc
{% endblock %}

{% block skip_dirs %}0{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block install %}
{{super()}}
genpc "libyuv" "100.0.0"
{% endblock %}
