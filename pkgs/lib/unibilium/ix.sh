{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/neovim/unibilium/archive/refs/tags/v2.1.2.tar.gz
sha:370ecb07fbbc20d91d1b350c55f1c806b06bf86797e164081ccc977fc9b3af7a
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
