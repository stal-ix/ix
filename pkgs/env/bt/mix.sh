{% extends '//mix/template/hub.sh' %}

{% block lib_deps %}
env/bt/{{buildtype or 'release'}}/mix.sh
{% endblock %}
