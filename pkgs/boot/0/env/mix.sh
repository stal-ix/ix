{% extends '//mix/template/hub.sh' %}

{% block run_deps %}
boot/0/mix/{{host.os}}/{{host.arch}}/mix.sh
env/release/mix.sh
env/compress/0/mix.sh
{% endblock %}
