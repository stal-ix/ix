{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://github.com/vifm/vifm/archive/refs/tags/v0.14.tar.gz
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
