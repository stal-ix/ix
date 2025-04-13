{% extends '//die/c/make.sh' %}

{% block pkg_name %}
libtermkey
{% endblock %}

{% block version %}
0.20
{% endblock %}

{% block fetch %}
https://github.com/neovim/libtermkey/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:7567e1de8232bf4a35cb713456c63b329755b56182bdc2c9cebfa0f0192615dd
{% endblock %}

{% block lib_deps %}
lib/c
lib/curses
lib/unibilium
{% endblock %}

{% block bld_tool %}
bld/perl
bld/gzip
bld/libtool
bld/pkg/config
{% endblock %}
