{% extends '//mix/template/hub.sh' %}

{% block run_deps %}
alt/box/{{box or 'gnu'}}/mix.sh
{% endblock %}
