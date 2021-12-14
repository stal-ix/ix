{% extends '//mix/template/hub.sh' %}

{% block run_deps %}
alt/sh/{{shell or 'dash'}}/mix.sh
{% endblock %}
