{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/wlroots/{{wlroots_ver or '16'}}
{% endblock %}
