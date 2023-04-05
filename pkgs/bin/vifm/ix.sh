{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://github.com/vifm/vifm/archive/refs/tags/v0.13.tar.gz
sha:8379397b2824cc74a91f5cfa00b5496f5d08cdcec18e3d13b64c480151225ca8
{% endblock %}

{% block bld_libs %}
lib/c
lib/curses
{% endblock %}

{% block bld_tool %}
bld/perl
bin/mandoc
{% endblock %}
