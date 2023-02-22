{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/moe/moe-1.13.tar.lz
sha:43a557bc512f89d6c718e5f41029cfe3a055682620eb8dbece6302f34a26146b
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/curses
{% endblock %}
