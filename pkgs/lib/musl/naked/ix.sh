{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/musl/compat
lib/musl/naked/unwrap
{% if x86_64 %}
lib/str
{% endif %}
{% endblock %}
