{% extends '//die/c/make.sh' %}

{% set version %}3.5{% endset %}

{% block fetch %}
https://github.com/wfeldt/libx86emu/archive/refs/tags/{{version}}.tar.gz
sha:91da55f5da55017d5a80e2364de30f9520aa8df2744ff587a09ba58d6e3536c8
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block make_target %}
shared
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block make_flags %}
CC=clang
VERSION={{version}}
LIBDIR=lib
DESTDIR=${out}/
BRANCH={{version}}
MAJOR_VERSION‎=1
{% endblock %}

{% block patch %}
rm git2log
echo '{{version}}' > VERSION
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
mv usr/include ./
rm -rf usr
{% endblock %}
