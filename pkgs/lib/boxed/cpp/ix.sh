{% extends '//die/c/cmake.sh' %}

{% block version %}
1.4.3
{% endblock %}

{% block fetch %}
https://github.com/contour-terminal/boxed-cpp/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:75afd9c1627846ed350253b0885a71207a0c2d52f350ded86daa5d18712bad93
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
