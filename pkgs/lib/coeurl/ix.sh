{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
coeurl
{% endblock %}

{% block version %}
0.3.2
{% endblock %}

{% block fetch %}
https://nheko.im/nheko-reborn/coeurl/-/archive/v{{self.version().strip()}}/coeurl-v{{self.version().strip()}}.tar.bz2
97ec435205fad92cf3cc2a37cc884b7dbc1d94c1c95e61cfaf13fea7f0d4044d
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/fmt
lib/curl
lib/event
lib/spdlog
{% endblock %}
