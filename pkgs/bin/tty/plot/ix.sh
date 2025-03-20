{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/tenox7/ttyplot/archive/refs/tags/1.7.1.tar.gz
sha:d1624eea52abec5538c9b19bae00f81642c2d2886cd7755988466b74424ce9ca
{% endblock %}

{% block bld_libs %}
lib/c
lib/curses
{% endblock %}

{% block bld_tool %}
bld/pkg/config
{% endblock %}
