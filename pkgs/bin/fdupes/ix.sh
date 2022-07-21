{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/adrianlopezroche/fdupes/archive/refs/tags/v2.1.2.tar.gz
sha:47536dad3f628b49420d60be55417238e537902a7461e19f199092ab8b24e8f1
{% endblock %}

{% block bld_libs %}
lib/c
lib/pcre/2
lib/curses
{% endblock %}
