{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if linux %}
lib/musl/pure(std_env=bld/boot/9/env/cxx,boot=1)
{% endif %}
{% if darwin %}
lib/darwin/c(boot=1)
{% endif %}
{% endblock %}
