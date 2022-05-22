{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if linux %}
lib/{{libc or 'musl'}}
{% endif %}
{% if darwin %}
lib/darwin/c
{% endif %}
{% endblock %}
