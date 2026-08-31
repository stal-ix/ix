{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/sway/nc/unwrap(gtk_ver=4)
bin/xdg/er(wrap=swaync)
{% endblock %}
