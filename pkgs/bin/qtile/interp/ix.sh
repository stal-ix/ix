{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/python/{{python_ver}}(py_extra_modules=bin/qtile/module/register)
{% endblock %}
