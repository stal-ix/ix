{% extends '//die/c/cmake.sh' %}

{% block version %}
2.3.3
{% endblock %}

{% block fetch %}
https://github.com/stp/stp/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:ea6115c0fc11312c797a4b7c4db8734afcfce4908d078f386616189e01b4fffa
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
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
