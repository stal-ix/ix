{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
vifm
{% endblock %}

{% block version %}
0.14.2
{% endblock %}

{% block fetch %}
https://github.com/vifm/vifm/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:f0e06b50d756ab621a4b7494598a02c5911d422dc69e14f27017883672a72301
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
