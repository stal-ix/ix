{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
uchardet
{% endblock %}

{% block version %}
0.0.8
{% endblock %}

{% block fetch %}
https://www.freedesktop.org/software/uchardet/releases/uchardet-{{self.version().strip()}}.tar.xz
sha:e97a60cfc00a1c147a674b097bb1422abd9fa78a2d9ce3f3fdcc2e78a34ac5f0
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
