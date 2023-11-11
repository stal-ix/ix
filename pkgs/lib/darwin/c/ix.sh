{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/build
lib/darwin/c/{{macos_sdk or 'phracker'}}
{% endblock %}
