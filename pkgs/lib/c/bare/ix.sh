{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if wasi %}
lib/wasi/c
{% else %}
lib/c/naked
lib/c/alloc
lib/compiler_rt/builtins
{% endif %}
{% endblock %}
