{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if wasi %}
lib/magic/wasi
{% else %}
lib/magic/common
{% endif %}
{% endblock %}
