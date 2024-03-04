{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/wrapcc/link/dyn
bld/fake(tool_name=ldd)
bld/gir/scanner/scripts
bld/gir/scanner/unwrap(python_ver=10)
{% endblock %}
