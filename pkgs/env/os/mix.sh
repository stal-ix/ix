{% extends '//mix/template/hub.sh' %}

{% block deps %}
env/release/mix.sh
env/os/{{mix.platform.target.os}}/mix.sh
{% endblock %}
