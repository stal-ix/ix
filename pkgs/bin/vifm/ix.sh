{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
vifm
{% endblock %}

{% block version %}
0.14
{% endblock %}

{% block fetch %}
https://github.com/vifm/vifm/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:c78d585327571f5572ecc5636571086d0247158d9ff56f2bd53f016cd0b2e3b5
{% endblock %}

{% block bld_libs %}
lib/c
lib/curses
{% endblock %}

{% block bld_tool %}
bld/perl
bin/mandoc
{% endblock %}
