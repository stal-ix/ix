{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/gnome/console/unwrap
bin/xdg/wrapper(name=kgx)
{% endblock %}
