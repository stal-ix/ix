{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/udev/g/{{target.os}}
{% endblock %}
