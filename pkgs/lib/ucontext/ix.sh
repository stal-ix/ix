{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if linux %}
lib/ucontext/iface
lib/ucontext/stock
{% endif %}
{% endblock %}
