{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/hyprwm/hyprcursor/archive/refs/tags/v0.1.5.tar.gz
sha:3958b0d7b80bcabca1c46841016c7354afc3cbcbf86b785b7b6289524cb5ec5c
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/zip
lib/cairo
lib/hypr/lang
{% endblock %}

{% block bld_libs %}
lib/hypr/rsvg
{% endblock %}
