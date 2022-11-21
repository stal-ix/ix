{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/gnome/font/viewer/unwrap
bin/xdg/wrapper(name=gnome-font-viewer)
{% endblock %}
