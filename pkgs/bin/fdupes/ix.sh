{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/adrianlopezroche/fdupes/archive/refs/tags/v2.3.2.tar.gz
sha:735f0a8f3076184ee1966c5671dac05df5a9ab40ac04dce374ccb9fe43560398
{% endblock %}

{% block bld_libs %}
lib/c
lib/curses
lib/pcre/2
lib/sqlite/3
{% endblock %}
