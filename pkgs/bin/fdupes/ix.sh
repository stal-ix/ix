{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/adrianlopezroche/fdupes/archive/refs/tags/v2.2.0.tar.gz
sha:8f02e6d855c56f38afdac9ff5ae2becd79cf7b87c31aa7bf9e3620d1bac00bab
{% endblock %}

{% block bld_libs %}
lib/c
lib/pcre/2
lib/curses
{% endblock %}
