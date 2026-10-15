{% extends '//lib/pypy/cffi/t/dl.sh' %}

{% include '//lib/pypy/cffi/curses/mod.sh' %}

{% block lib_deps %}
lib/pypy/cffi/curses
{% endblock %}
