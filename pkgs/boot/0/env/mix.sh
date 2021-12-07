{% extends '//mix/template/hub.sh' %}

{% block ind_deps %}
env/release/mix.sh
{% endblock %}

{% block run_deps %}
boot/0/mix/{{host.os}}/{{host.arch}}/mix.sh
env/compress/0/mix.sh
{% endblock %}
