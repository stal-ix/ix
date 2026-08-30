{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libdwarf
{% endblock %}

{% block version %}
2.3.2
{% endblock %}

{% block fetch %}
https://www.prevanders.net/libdwarf-{{self.version().strip()}}.tar.xz
7992e7b9019ebfabdda5773e86243517c48cf89fafed3209e853692bc9573efd
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
