{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/musl/env
lib/musl/pure
lib/compiler_rt/builtins
{% endblock %}
