{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/adrianlopezroche/fdupes/archive/refs/tags/v2.4.0.tar.gz
sha:2a11250ef0e9d82837dcf336853b2891732cc78e2888ccdc6b689ab7b47b0f5b
{% endblock %}

{% block bld_libs %}
lib/c
lib/curses
lib/pcre/2
lib/sqlite/3
{% endblock %}
