{% extends '//mix/template/hub.sh' %}

{% block ind_deps %}
env/bt/mix.sh
{% endblock %}

{% block run_deps %}
boot/0/mix/mix.sh
env/compress/0/mix.sh
{% endblock %}
