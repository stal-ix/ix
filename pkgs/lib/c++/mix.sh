{% extends '//mix/template/hub.sh' %}

{% block lib_deps %}
lib/c++/{{cplpl_std or '20'}}/mix.sh
{% endblock %}
