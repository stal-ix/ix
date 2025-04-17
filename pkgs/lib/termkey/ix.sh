{% extends '//die/c/make.sh' %}

{% block pkg_name %}
libtermkey
{% endblock %}

{% block version %}
0.22
{% endblock %}

{% block fetch %}
https://github.com/neovim/libtermkey/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:81cac2b685c9ada4ead4ea788fb69ff74fc1947ad188ed0264c646fe12b496ba
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
