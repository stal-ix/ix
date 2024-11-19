{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/google/libultrahdr/archive/refs/tags/v1.3.0.tar.gz
sha:bf425e10a1a36507d47eb2711018e90effe11c76db8ecd4f10f4e1af9cb5288c
{% endblock %}

{% block lib_deps %}
lib/c
lib/jpeg
{% endblock %}
