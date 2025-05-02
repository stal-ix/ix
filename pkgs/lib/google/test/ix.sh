{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
googletest
{% endblock %}

{% block version %}
1.17.0
{% endblock %}

{% block fetch %}
https://github.com/google/googletest/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:65fab701d9829d38cb77c14acdc431d2108bfdbf8979e40eb8ae567edf10b27c
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
