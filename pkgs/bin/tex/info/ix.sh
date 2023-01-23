{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/texinfo/texinfo-7.0.2.tar.xz
sha:f211ec3261383e1a89e4555a93b9d017fe807b9c3992fb2dff4871dae6da54ad
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
lib/curses
{% endblock %}

{% block bld_tool %}
bld/perl
{% endblock %}
