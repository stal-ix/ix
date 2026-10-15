{% extends '//lib/pypy/cffi/t/dl.sh' %}

{% include '//lib/pypy/cffi/ssl/mod.sh' %}

{% block lib_deps %}
lib/pypy/cffi/ssl
{% endblock %}
