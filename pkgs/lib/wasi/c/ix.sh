{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if threads %}
lib/wasi/c/threads
{% else %}
lib/wasi/c/simple
{% endif %}
lib/wasi/c/shim
{% endblock %}
