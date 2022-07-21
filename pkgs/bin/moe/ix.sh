{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/moe/moe-1.12.tar.lz
sha:8a885f2be426f8e04ad39c96012bd860954085a23744f2451663168826d7a1e8
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/curses
{% endblock %}
