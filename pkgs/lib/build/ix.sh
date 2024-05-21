{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if armv7 %}
lib/build/cpu/armv7
{% endif %}
lib/build/opt
lib/build/type
{% if linux %}
lib/build/noexec
{% endif %}
lib/build/sanitize
{% endblock %}
