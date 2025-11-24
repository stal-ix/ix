{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
simdutf
{% endblock %}

{% block version %}
7.7.0
{% endblock %}

{% block fetch %}
https://github.com/simdutf/simdutf/archive/refs/tags/v{{self.version().strip()}}.tar.gz
0180de81a1dd48a87b8c0442ffa81734f3db91a7350914107a449935124e3c6f
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
