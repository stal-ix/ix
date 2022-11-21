{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/gnome/font/viewer/unwrap
bin/xdg/er(wrap=gnome-font-viewer)
{% endblock %}
