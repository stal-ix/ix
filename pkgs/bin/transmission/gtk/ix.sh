{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/transmission/cli
bin/transmission/gtk/unwrap
bin/xdg/er(wrap=transmission-gtk)
{% endblock %}
