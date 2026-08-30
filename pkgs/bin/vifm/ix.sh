{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
vifm
{% endblock %}

{% block version %}
0.14.4
{% endblock %}

{% block fetch %}
https://github.com/vifm/vifm/archive/refs/tags/v{{self.version().strip()}}.tar.gz
eaabff68da048620e30b3131c8fbb0cdd60177591409acd28a7ad5339c166e80
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
