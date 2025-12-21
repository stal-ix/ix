{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/java/boot
bld/java/boot/free
bld/java/boot/ant/10
bld/fake(tool_name=ldd)
bld/java/boot/iced/readelf
{% endblock %}
