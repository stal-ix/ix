{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/build/cpu
lib/build/opt
lib/build/type
{% if linux %}
lib/build/noexec
{% endif %}
lib/build/sanitize
{% endblock %}
