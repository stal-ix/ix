{% extends '//die/meson.sh' %}

{% block fetch %}
https://github.com/fribidi/fribidi/archive/refs/tags/v1.0.12.tar.gz
sha:2e9e859876571f03567ac91e5ed3b5308791f31cda083408c2b60fa1fe00a39d
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block meson_flags %}
docs=false
tests=false
{% endblock %}
