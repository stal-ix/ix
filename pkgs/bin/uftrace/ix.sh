{% extends '//die/make.sh' %}

{# broken for static binaries #}

{% block fetch %}
https://github.com/namhyung/uftrace/archive/refs/tags/v0.12.tar.gz
sha:2aad01f27d4f18717b681824c7a28ac3e1efd5e7bbed3ec888a3ea5af60e3700
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/linux
lib/curses
lib/elfutils
lib/cap/stone
{% endblock %}

{% block configure %}
bash ./configure --prefix=${out} --without-libpython --without-libluajit
{% endblock %}

{% block bld_tool %}
bld/bash
bld/pkg/config
{% endblock %}
