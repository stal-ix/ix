{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/google/double-conversion/archive/refs/tags/v3.3.0.tar.gz
sha:04ec44461850abbf33824da84978043b22554896b552c5fd11a9c5ae4b4d296e
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
