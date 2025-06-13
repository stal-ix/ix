{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
fdupes
{% endblock %}

{% block version %}
2.4.0
{% endblock %}

{% block fetch %}
https://github.com/adrianlopezroche/fdupes/archive/refs/tags/v{{self.version().strip()}}.tar.gz
2a11250ef0e9d82837dcf336853b2891732cc78e2888ccdc6b689ab7b47b0f5b
{% endblock %}

{% block bld_libs %}
lib/c
lib/curses
lib/pcre/2
lib/sqlite/3
{% endblock %}
