{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
vifm
{% endblock %}

{% block version %}
0.14.1
{% endblock %}

{% block fetch %}
https://github.com/vifm/vifm/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:a372f97b7bffef9ace49a168bb281f4f48e04aa6826ccb78ed251e9eead60488
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
