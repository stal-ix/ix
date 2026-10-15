{% extends '//lib/pypy/cffi/t/dl.sh' %}

{% include '//lib/pypy/cffi/sqlite/3/mod.sh' %}

{% block lib_deps %}
lib/pypy/cffi/sqlite/3
{% endblock %}
