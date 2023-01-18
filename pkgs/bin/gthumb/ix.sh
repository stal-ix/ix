{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/gthumb/stock
bin/xdg/er(wrap=gthumb)
{% endblock %}
