{% extends '//die/inline/library.sh' %}

{% block lib_deps %}
lib/musl/naked/unwrap
{% endblock %}

{% block sources %}
compat.c
{% endblock %}
