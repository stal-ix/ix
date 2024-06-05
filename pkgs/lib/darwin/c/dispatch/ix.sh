{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if macos_sdk %}
lib/darwin/c/{{macos_sdk}}
{% elif native %}
lib/darwin/c/native
{% if boot %}
lib/darwin/c/native/crt
{% endif %}
{% else %}
lib/darwin/c/phracker
{% endif %}
{% endblock %}
