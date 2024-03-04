{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/dlfcn
bld/python
bld/kuroko
bld/wrapcc/kuroko
bld/wrapcc/exelink
bld/wrapcc/dynlink
bld/wrapcc/liblink
{% endblock %}
