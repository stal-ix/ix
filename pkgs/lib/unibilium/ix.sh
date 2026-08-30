{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
unibilium
{% endblock %}

{% block version %}
2.1.4
{% endblock %}

{% block fetch %}
https://github.com/neovim/unibilium/archive/refs/tags/v{{self.version().strip()}}.tar.gz
7360907bcf79ba49f6fc4a504767ff86e93ab9018477026fcc70d5ab77e1f2c1
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/perl
bld/gzip
bld/libtool
{% endblock %}

{% block use_data %}
aux/terminfo
{% endblock %}

{% block make_flags %}
TERMINFO_DIRS="\"${TERMINFO}\""
{% endblock %}
