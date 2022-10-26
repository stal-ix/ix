{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/inetutils/inetutils-2.4.tar.xz
sha:1789d6b1b1a57dfe2a7ab7b533ee9f5dfd9cbf5b59bb1bb3c2612ed08d0f68b2
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
