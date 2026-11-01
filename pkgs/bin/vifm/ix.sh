{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
vifm
{% endblock %}

{% block version %}
0.14.5
{% endblock %}

{% block fetch %}
https://github.com/vifm/vifm/archive/refs/tags/v{{self.version().strip()}}.tar.gz
2bb0b7ca2aa8be0d5df2a7271d4e50f27aec053652298c2b14be38703e206ab3
{% endblock %}

{% block bld_libs %}
lib/c
lib/curses
{% endblock %}

{% block bld_tool %}
bld/perl
bin/mandoc
{% endblock %}

{% block cpp_defines %}
LONG_LONG_MAX=LLONG_MAX
{% endblock %}
