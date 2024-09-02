{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/google/libultrahdr/archive/refs/tags/v1.1.1.tar.gz
sha:5c2605bfa8cc56027892e66db8317784949e79bccf197dbcc5c48c8b94f86f32
{% endblock %}

{% block lib_deps %}
lib/c
lib/jpeg
{% endblock %}
