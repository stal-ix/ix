{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libdwarf
{% endblock %}

{% block version %}
2.3.0
{% endblock %}

{% block fetch %}
https://www.prevanders.net/libdwarf-{{self.version().strip()}}.tar.xz
a153e8101828a478f88d18341267b59c19a3fc794bea47388347ce994ba90c17
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
