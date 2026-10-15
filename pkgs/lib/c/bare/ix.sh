{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if wasi %}
lib/wasi/c
{% if target.kernel == 'none' %}
lib/wasi/null
{% endif %}
{% else %}
lib/c/naked
{% endif %}
lib/c/alloc
lib/compiler_rt/builtins
{% endblock %}
