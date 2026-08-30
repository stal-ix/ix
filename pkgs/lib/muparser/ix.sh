{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
muparser
{% endblock %}

{% block version %}
2.3.5
{% endblock %}

{% block fetch %}
https://github.com/beltoforion/muparser/archive/refs/tags/v{{self.version().strip()}}.tar.gz
20b43cc68c655665db83711906f01b20c51909368973116dfc8d7b3c4ddb5dd4
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block cmake_flags %}
ENABLE_SAMPLES=OFF
ENABLE_OPENMP=OFF
{% endblock %}
