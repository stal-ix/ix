{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/gnome/font/viewer/unwrap
bin/xdg/wrapper(wrap=gnome-font-viewer)
{% endblock %}
