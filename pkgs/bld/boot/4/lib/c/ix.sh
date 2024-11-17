{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if linux %}
lib/musl/boot(std_env=bld/boot/4/env/box,boot=1)
{% endif %}
{% if darwin %}
lib/darwin/c(boot=1)
{% endif %}
{% endblock %}
