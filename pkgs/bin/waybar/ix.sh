{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/waybar/unwrap(libcplpl_ver=16)
{% endblock %}
