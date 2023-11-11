{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/build
{% if macos_sdk %}
lib/darwin/c/{{macos_sdk}}
{% elif native %}
lib/darwin/c/native
{% else %}
lib/darwin/c/phracker
{% endif %}
{% endblock %}
