{% extends '//mix/template/hub.sh' %}

{% block lib_deps %}
lib/jpeg/{{jpeg or 'moz'}}
{% endblock %}
