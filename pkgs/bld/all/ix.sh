{% extends '//die/hub.sh' %}

{# all (std_box=) targets should be mentioned here #}

{% block run_deps %}
{% if x86_64 %}
bld/nasm
{% endif %}
{% if darwin %}
bld/cctools
{% endif %}
bld/auto/python
bld/auto/archive
bld/glib/old
bld/auto
bld/bash
bld/bison
bld/box
bld/byacc
bld/cmake
bld/flex
bld/glib
bld/gzip
bld/m4
bld/make
bld/meson/1
bld/ninja
bld/perl
bld/pkg/config
bld/python
bld/re2c
bld/sh
bld/tar
bld/texinfo
bld/texinfo/lite
bld/compiler
bld/libtool
bld/kuroko
bld/xz
bin/dash
{% endblock %}
