{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if linux %}
{% if armv7 %}
lib/compiler_rt/builtins/hack
{% else %}
lib/compiler_rt/builtins/{{crt_ver or '19'}}
{% endif %}
{% else %}
# TODO(pg): fix builtins for darwin
lib/compiler_rt/builtins/hack
{% endif %}
{% endblock %}
