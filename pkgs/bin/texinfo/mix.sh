{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/texinfo/texinfo-6.8.tar.xz
a91b404e30561a5df803e6eb3a53be71
{% endblock %}

{% block bld_libs %}
lib/c
lib/curses
{% endblock %}

{% block bld_tool %}
bld/perl
{% endblock %}

{% block std_box %}
bld/bootbox
{% endblock %}
