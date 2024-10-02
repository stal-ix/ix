{% extends 't/ix.sh' %}

{% block make_target %}
device-mapper
{% endblock %}

{% block make_install_target %}
install_device-mapper
{% endblock %}
