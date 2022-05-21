{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/c/naked
lib/c/alloc
{% if linux %}
lib/compiler_rt/builtins
{% else %}
# TODO(pg): fix builtins for darwin
lib/compiler_rt/hack
{% endif %}
{% endblock %}
