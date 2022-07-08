{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/inetutils/inetutils-2.3.tar.xz
sha:0b01bb08e29623c4e3b940f233c961451d9af8c5066301add76a52a95d51772c
{% endblock %}

{% block bld_libs %}
lib/c
lib/xcrypt
lib/curses
lib/readline
{% endblock %}

{% block bld_tool %}
bld/bison
{% endblock %}
