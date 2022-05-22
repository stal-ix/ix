{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if linux %}
bld/boot/1/lib/musl
{% endif %}
{% if darwin %}
lib/darwin/c
{% endif %}
{% endblock %}
