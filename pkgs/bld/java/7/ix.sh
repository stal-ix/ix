{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/java/boot
bld/java/boot/free
bld/fake(tool_name=ldd)
bld/java/boot/iced/readelf
{% endblock %}
