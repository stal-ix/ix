{% extends '//lib/pypy/cffi/t/dl.sh' %}

{% include '//lib/pypy/cffi/syslog/mod.sh' %}

{% block lib_deps %}
lib/pypy/cffi/syslog
{% endblock %}
