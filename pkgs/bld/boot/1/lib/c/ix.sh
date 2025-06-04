{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if linux %}
lib/musl/env
bld/boot/1/lib/crt
bld/boot/1/lib/musl
{% endif %}
{% if darwin %}
lib/darwin/c(boot=1)
{% endif %}
{% endblock %}
