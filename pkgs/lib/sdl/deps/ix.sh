{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if linux %}
lib/dbus/dl
lib/drivers/3d
{% endif %}
{% endblock %}
