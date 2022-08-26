{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/flex
bin/make
bin/gcc/cc
bin/bison/3/6
# TODO(pg): kinda hack, need proper run_libs
lib/musl/pure(kind=lib)
lib/curses/n(kind=lib)
{% endblock %}
