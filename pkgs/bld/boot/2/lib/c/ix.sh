{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if linux %}
bld/boot/1/lib/crt
bld/boot/2/lib/musl(std_env=bld/boot/2/env,boot=1)
{% endif %}
{% if darwin %}
lib/darwin/c(boot=1)
{% endif %}
{% endblock %}
