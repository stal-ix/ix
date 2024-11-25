{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if ix_boot_tool('clang++') %}
bin/clang/lib
{% elif ix_boot_tool('g++') %}
bin/gcc/env
{% else %}
{{error('can not find suitable bootstrap compiler')}}
{% endif %}
{% endblock %}
