{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/gthumb/unwrap
bin/xdg/er(wrap=gthumb)
{% endblock %}
