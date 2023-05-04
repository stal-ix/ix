{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if linux %}
lib/musl/pure(std_env=bld/boot/8/env/cxx,boot=1)
{% endif %}
{% if darwin %}
lib/darwin/c
{% endif %}
{% endblock %}
