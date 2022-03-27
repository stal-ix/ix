{% extends '//mix/hub.sh' %}

{% block lib_deps %}
lib/gstreamer/{{gstreamer_ver or '20'}}
{% endblock %}
