{% extends '//die/c/autorehell.sh' %}

{% block version %}
2.6
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/inetutils/inetutils-{{self.version().strip()}}.tar.xz
sha:68bedbfeaf73f7d86be2a7d99bcfbd4093d829f52770893919ae174c0b2357ca
{% endblock %}

{% block bld_libs %}
lib/c
lib/curses
lib/readline
{% endblock %}

{% block bld_tool %}
bld/bison
{% endblock %}
