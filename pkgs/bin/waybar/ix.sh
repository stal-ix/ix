{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/waybar/unwrap
{% endblock %}

{% block run_data %}
aux/fonts/awesome
{% endblock %}
