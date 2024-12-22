{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
bin/pypy/externmod
{% endblock %}

{% block export_libs %}
liblib_pypy_externmod.a
{% endblock %}

{% block export_symbols %}
PyExpat_XML_ExpatVersion
{% endblock %}

{% block export_lib %}
externmod
{% endblock %}
