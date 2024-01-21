{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/musl/env
lib/musl/compat
lib/musl/naked/unwrap
{% endblock %}
