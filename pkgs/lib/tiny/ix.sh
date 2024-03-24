{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if linux %}
lib/bumpalloc
lib/musl/naked
{% else %}
lib/c
{% endif %}
{% endblock %}
