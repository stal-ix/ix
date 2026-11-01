{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
inetutils
{% endblock %}

{% block version %}
2.8
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/inetutils/inetutils-{{self.version().strip()}}.tar.gz
57b3cf4f77555992881e5ba2a09a63b05aa2c56342a60ed4305b5f45938390b5
{% endblock %}

{% block bld_libs %}
lib/c
lib/curses
lib/readline
{% endblock %}

{% block bld_tool %}
bld/bison
{% endblock %}
