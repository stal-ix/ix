{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if ix_boot_path %}
  {% if ix_boot_tool('clang++') %}
    bin/clang/lib
  {% elif ix_boot_tool('g++') %}
    bin/gcc/env/sys
  {% else %}
    {{ix.error('can not find suitable bootstrap compiler')}}
  {% endif %}
{% else %}
# not bootstrap tools for fake runner
{% endif %}
{% endblock %}
