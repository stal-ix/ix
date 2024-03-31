{% extends '//die/c/meson.sh' %}

{% block git_repo %}
https://github.com/tomba/kmsxx
{% endblock %}

{% block git_commit %}
9ae90ce75478e49844cf984562db0dc1a074462f
{% endblock %}

{% block git_sha %}
0bbc8eb93f87223956913e8e18abbf828eb3cd88e7e35d7a9b2cfbee42c6a394
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/drm
lib/fmt
{% endblock %}

{% block git_version %}
v3
{% endblock %}
