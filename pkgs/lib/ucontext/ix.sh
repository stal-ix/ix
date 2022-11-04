{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if linux %}
lib/ucontext/posix
lib/ucontext/iface
{% endif %}
{% endblock %}
