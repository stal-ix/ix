{% extends '//lib/pypy/cffi/t/dl.sh' %}

{% include '//lib/pypy/cffi/blake/2/b/mod.sh' %}

{% block lib_deps %}
lib/pypy/cffi/blake/2/b
{% endblock %}
