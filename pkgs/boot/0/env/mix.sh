{% extends '//mix/template/hub.sh' %}

{% block deps %}
boot/0/mix/{{mix.platform.target.os}}/{{mix.platform.target.arch}}/mix.sh
env/os/mix.sh
env/compress/0/mix.sh
{% endblock %}
