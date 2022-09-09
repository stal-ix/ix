{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/adrianlopezroche/fdupes/archive/refs/tags/v2.2.1.tar.gz
sha:7d12e9d28c6a5dc46ff3a37fafd65b4b84f5c19dddf630beec8d67bc158fa265
{% endblock %}

{% block bld_libs %}
lib/c
lib/pcre/2
lib/curses
{% endblock %}
