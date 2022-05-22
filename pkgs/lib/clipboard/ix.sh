{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if linux %}
lib/clipboard/fake
{% else %}
lib/clipboard/real
{% endif %}
{% endblock %}
