{% extends '//mix/template/hub.sh' %}

{% block lib_deps %}
lib/build/opt/{{opt or 'safe'}}/mix.sh
{% endblock %}
