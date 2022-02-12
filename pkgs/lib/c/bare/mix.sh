{% extends '//mix/hub.sh' %}

{% block lib_deps %}
lib/c/naked
lib/c/alloc
{% if target.os == 'linux' %}
lib/compiler_rt/builtins
{% else %}
# TODO(pg): fix builtins for darwin
lib/compiler_rt/hack
{% endif %}
{% endblock %}
