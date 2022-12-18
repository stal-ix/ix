{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/sh
bin/gcc
bld/box
bld/flex
bld/make
bld/bison
bld/compiler
bin/clang/env
bld/pkg/config
lib/curses/kernel(kind=lib)
{% endblock %}
