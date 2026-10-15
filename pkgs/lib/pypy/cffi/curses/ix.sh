{% extends '//lib/pypy/cffi/t/ix.sh' %}

{% include '//lib/pypy/cffi/curses/mod.sh' %}

{# lib_deps, not bld_libs: whoever links this archive needs the
   library on the same line, and bld_libs stop here #}
{% block lib_deps %}
lib/ncurses
{% endblock %}
