{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/python
bld/implib/scripts
bld/fake(tool_name=c++filt)
{% endblock %}
