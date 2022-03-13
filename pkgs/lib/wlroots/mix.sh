{% extends '//mix/hub.sh' %}

{% block lib_deps %}
lib/wlroots/{{wlroots_ver or '15'}}
{% endblock %}
