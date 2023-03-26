{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/texinfo/texinfo-7.0.3.tar.xz
sha:74b420d09d7f528e84f97aa330f0dd69a98a6053e7a4e01767eed115038807bf
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
lib/curses
{% endblock %}

{% block bld_tool %}
bld/perl
{% endblock %}
