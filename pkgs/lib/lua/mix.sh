{% extends '//mix/template/hub.sh' %}

{% block lib_deps %}
lib/lua/{{lua or 'puc'}}/mix.sh
{% endblock %}
