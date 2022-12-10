{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/sh
bld/box
bin/flex
bin/make
bin/gcc/cc
bin/bison/3/6
# TODO(pg): kinda hack, need proper run_libs
lib/musl/kbuild(kind=lib)
lib/curses/n(kind=lib)
lib/compiler_rt/builtins(kind=lib)
{% endblock %}
