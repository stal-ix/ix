{% extends '//mix/template/hub.sh' %}

{% block deps %}
boot/0/mix/{{mix.platform.target.os}}/{{mix.platform.target.arch}}/mix.sh
env/system/mix.sh
env/bootstrap/mix.sh
{% endblock %}
