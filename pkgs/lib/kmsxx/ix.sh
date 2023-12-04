{% extends '//die/c/meson.sh' %}

{% block git_repo %}
https://github.com/tomba/kmsxx
{% endblock %}

{% block git_commit %}
9ae90ce75478e49844cf984562db0dc1a074462f
{% endblock %}

{% block git_sha %}
b594f5b27fffde8272132a281ff5c9545e8ec4e346813f4884b5146d22cde008
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/drm
lib/fmt
{% endblock %}
