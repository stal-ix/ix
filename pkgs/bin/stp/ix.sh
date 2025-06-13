{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
stp
{% endblock %}

{% block version %}
2.3.4
{% endblock %}

{% block fetch %}
https://github.com/stp/stp/archive/refs/tags/{{self.version().strip()}}.tar.gz
dc197e337c058dc048451b712169a610f7040b31d0078b6602b831fbdcbec990
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/gmp/c++
lib/mini/sat
{% endblock %}

{% block bld_tool %}
bld/perl
bld/flex
bld/bison
bld/help2man
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}
