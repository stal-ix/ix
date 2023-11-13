{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/darwin/c/phracker/{{sdk_target.replace('.', '/')}}
{% endblock %}
