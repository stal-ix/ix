{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/moe/moe-1.14.tar.lz
sha:f4babd6ce0ae19516f983454fb20d32dff71ad316337ac6bf93a42a5ff209c9d
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/curses
{% endblock %}
