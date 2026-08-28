{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libxmp
{% endblock %}

{% block version %}
4.7.2
{% endblock %}

{% block fetch %}
https://github.com/libxmp/libxmp/archive/refs/tags/libxmp-{{self.version().strip()}}.tar.gz
3a6ad7d154d931e21db79e1c0af3253998555c73706083ce9ab2b634180a6e99
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
