{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/inetutils/inetutils-2.5.tar.xz
sha:87697d60a31e10b5cb86a9f0651e1ec7bee98320d048c0739431aac3d5764fb6
{% endblock %}

{% block bld_libs %}
lib/c
lib/curses
lib/readline
{% endblock %}

{% block bld_tool %}
bld/bison
{% endblock %}
