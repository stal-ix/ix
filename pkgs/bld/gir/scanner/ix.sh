{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/dlfcn
bld/python
bld/wrapcc/link/gir
bld/fake(tool_name=ldd)
bld/gir/scanner/scripts
bld/gir/scanner/unwrap(python_ver=10)
{% endblock %}
