{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if linux %}
lib/dbus/dl
{% endif %}
lib/drivers/3d
{% endblock %}
