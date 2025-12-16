{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/python
bld/java/boot/free
bld/java/boot/ant/10
bld/fake(tool_name=ldd)
bld/java/boot/iced/readelf
bld/java/boot/iced(opt=O0)
{% endblock %}
