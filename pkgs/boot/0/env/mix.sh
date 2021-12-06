{% extends '//mix/template/hub.sh' %}

{% block run_deps %}
boot/0/mix/{{target.os}}/{{target.arch}}/mix.sh
env/release/mix.sh
env/compress/0/mix.sh
{% endblock %}
