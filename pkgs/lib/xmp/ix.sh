{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libxmp
{% endblock %}

{% block version %}
4.6.2
{% endblock %}

{% block fetch %}
https://github.com/libxmp/libxmp/archive/refs/tags/libxmp-{{self.version().strip()}}.tar.gz
sha:88c8c68a5e38966c8735b20e63c552ed014ec75dde711dc7549a3eff4e4555cd
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
