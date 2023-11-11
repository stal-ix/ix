{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/darwin/c/{{macos_sdk or 'phracker'}}
{% endblock %}
