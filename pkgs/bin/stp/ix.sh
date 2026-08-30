{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
stp
{% endblock %}

{% block version %}
2.4.1
{% endblock %}

{% block fetch %}
https://github.com/stp/stp/archive/refs/tags/{{self.version().strip()}}.tar.gz
6f8bca3612e3d61868450dbf7771897b2a909f446e8de460bdf31f13a6cd0318
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
