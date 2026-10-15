{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/pypy/syms
{% endblock %}

{% block export_libs %}
libpypysyms.a
{% endblock %}

{% block export_lib %}
pypysyms
{% endblock %}
