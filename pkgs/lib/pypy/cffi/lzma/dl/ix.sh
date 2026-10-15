{% extends '//lib/pypy/cffi/t/dl.sh' %}

{% include '//lib/pypy/cffi/lzma/mod.sh' %}

{% block lib_deps %}
lib/pypy/cffi/lzma
{% endblock %}
