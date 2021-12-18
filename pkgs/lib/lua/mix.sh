{% extends '//mix/template/hub.sh' %}

{% block lib_deps %}
lib/lua/{{lua or 'jit'}}/mix.sh
{% endblock %}
