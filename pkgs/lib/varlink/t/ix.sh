{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/varlink/libvarlink/archive/refs/tags/24.tar.gz
sha:0586263ab8f4e8e26a2f2f54830f8f92e403326663b10e14fcf1a6c95e9eab95
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
