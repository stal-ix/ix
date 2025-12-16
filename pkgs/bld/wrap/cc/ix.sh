{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/dlfcn
bld/python
bld/kuroko
bld/wrap/cc/drv
bld/wrap/cc/exe
bld/wrap/cc/dyn
bld/wrap/cc/lib
{% endblock %}
