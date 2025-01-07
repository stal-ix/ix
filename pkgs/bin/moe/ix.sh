{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/moe/moe-1.15.tar.lz
sha:41f8c8b099ce3047945ca4e097a60d9243e9c73fbb268c194a12da8b0d9f0a66
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/curses
{% endblock %}
