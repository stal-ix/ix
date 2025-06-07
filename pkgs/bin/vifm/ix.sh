{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
vifm
{% endblock %}

{% block version %}
0.14.3
{% endblock %}

{% block fetch %}
https://github.com/vifm/vifm/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:9e21e69f0bfa00a470c01f4b83e011af6a4e69626237a8d12afc0d79a7819be8
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
