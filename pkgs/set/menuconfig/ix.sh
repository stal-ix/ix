{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/sh
bin/gcc
bld/box
bin/flex
bin/make
bld/compiler
bin/clang/env
bin/bison/3/6
bld/pkg/config
lib/curses/kernel(kind=lib)
{% endblock %}
