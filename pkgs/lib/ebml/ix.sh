{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libebml
{% endblock %}

{% block version %}
1.4.7
{% endblock %}

{% block fetch %}
https://github.com/Matroska-Org/libebml/archive/refs/tags/release-{{self.version().strip()}}.tar.gz
c55c5528e7510bc41b574dcac47bc6e3503fb3b9e78ad8c42541bf07d5ed71a9
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
