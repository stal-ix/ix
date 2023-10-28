{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/neovim/libtermkey/archive/refs/tags/v0.20.tar.gz
sha:7567e1de8232bf4a35cb713456c63b329755b56182bdc2c9cebfa0f0192615dd
{% endblock %}

{% block lib_deps %}
lib/c
lib/unibilium
{% endblock %}

{% block bld_tool %}
bld/perl
bld/gzip
bld/libtool
bld/pkg/config
{% endblock %}
