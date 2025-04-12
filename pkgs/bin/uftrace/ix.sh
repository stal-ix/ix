{% extends '//die/c/make.sh' %}

{% block pkg_name %}
uftrace
{% endblock %}

{% block version %}
0.12
{% endblock %}

{# broken for static binaries #}

{% block fetch %}
https://github.com/namhyung/uftrace/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:2aad01f27d4f18717b681824c7a28ac3e1efd5e7bbed3ec888a3ea5af60e3700
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/kernel
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
