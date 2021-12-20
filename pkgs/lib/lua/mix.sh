{% extends '//mix/template/hub.sh' %}

{% block lib_deps %}
lib/lua/{{luaver or 'jit'}}/mix.sh
{% endblock %}
