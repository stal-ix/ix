{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://www.freedesktop.org/software/uchardet/releases/uchardet-0.0.8.tar.xz
sha:e97a60cfc00a1c147a674b097bb1422abd9fa78a2d9ce3f3fdcc2e78a34ac5f0
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
