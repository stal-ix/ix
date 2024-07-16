{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/google/googletest/archive/refs/tags/v1.15.0.tar.gz
sha:7315acb6bf10e99f332c8a43f00d5fbb1ee6ca48c52f6b936991b216c586aaad
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
