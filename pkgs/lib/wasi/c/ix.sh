{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if threads %}
lib/wasi/c/threads
lib/shim/fake(lib_name=atomic)
{% else %}
lib/wasi/c/simple
{% endif %}
lib/wasi/c/shim
{% endblock %}
