{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
coeurl
{% endblock %}

{% block version %}
0.3.1
{% endblock %}

{% block fetch %}
https://nheko.im/nheko-reborn/coeurl/-/archive/v{{self.version().strip()}}/coeurl-v{{self.version().strip()}}.tar.bz2
3c0a63c9faec23494ca60ee729e876ec1fc4df453a1dfce201d1a8ac6ae5c9d5
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/fmt
lib/curl
lib/event
lib/spdlog
{% endblock %}
