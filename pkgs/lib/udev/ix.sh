{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/udev/{{udev or 'zero'}}
{% endblock %}
