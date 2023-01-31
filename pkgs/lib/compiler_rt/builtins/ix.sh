{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if linux %}
lib/compiler_rt/builtins/{{crt_ver or '16'}}
{% else %}
# TODO(pg): fix builtins for darwin
lib/compiler_rt/builtins/hack
{% endif %}
{% endblock %}
