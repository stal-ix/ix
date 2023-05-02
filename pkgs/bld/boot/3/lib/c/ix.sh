{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if linux %}
lib/musl/boot(std_env=bld/boot/3/make/env,boot=1)
{% endif %}
{% if darwin %}
lib/darwin/c
{% endif %}
{% endblock %}
