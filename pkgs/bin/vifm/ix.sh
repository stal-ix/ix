{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://github.com/vifm/vifm/archive/refs/tags/v0.12.1.tar.gz
sha:410b2f183e9fdefb145cf6811c106e9297c9d8f7ddfe38f8840869c63e089f95
{% endblock %}

{% block bld_libs %}
lib/c
lib/curses
{% endblock %}

{% block bld_tool %}
bin/mandoc
{% endblock %}
