{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/google/double-conversion/archive/refs/tags/v3.2.1.tar.gz
sha:e40d236343cad807e83d192265f139481c51fc83a1c49e406ac6ce0a0ba7cd35
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
