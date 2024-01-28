{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/adrianlopezroche/fdupes/archive/refs/tags/v2.3.0.tar.gz
sha:8f38d21eb53e27a43f6652f0c6fa80c673f18466760281e812e84f56c1d359e3
{% endblock %}

{% block bld_libs %}
lib/c
lib/curses
lib/pcre/2
lib/sqlite/3
{% endblock %}
