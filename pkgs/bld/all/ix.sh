{% extends '//die/hub.sh' %}

{# all (std_box=) targets should be mentioned here #}

{% block run_deps %}
bld/auto/archive
bld/auto
bld/bash
bld/bison
bld/box
bld/byacc
bld/cmake
bld/flex
bld/glib/codegen
bld/gzip
bld/help2man
bld/m4
bld/make
bld/meson
bld/ninja
bld/perl
bld/pkg/config
bld/python
bld/re2c
bld/sh
bld/tar
bld/texinfo
bld/compiler
bld/mold
bld/libtool
bld/cctools
{% endblock %}
