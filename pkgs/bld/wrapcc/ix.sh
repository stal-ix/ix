{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/dlfcn
bld/python
bld/kuroko
bld/wrapcc/kuroko
bld/wrapcc/link/exe
bld/wrapcc/link/dyn
bld/wrapcc/link/lib
{% endblock %}
