{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/system
bld/box/shim(std_box=bld/system)
bld/extract/scripts(std_box=bld/system)
{% endblock %}
