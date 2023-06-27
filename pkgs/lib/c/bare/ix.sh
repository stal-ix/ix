{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if wasi %}
lib/wasi/c
{% else %}
lib/c/naked
lib/c/alloc
{% endif %}
lib/compiler_rt/builtins
{% endblock %}
