{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/adrianlopezroche/fdupes/archive/refs/tags/v2.3.1.tar.gz
sha:fbf0a455d398d2bfeb86da832d736557a6ee09d0b1456b869698dc43c5cf5072
{% endblock %}

{% block bld_libs %}
lib/c
lib/curses
lib/pcre/2
lib/sqlite/3
{% endblock %}
