{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/dropbear
bin/dropbear/runit/scripts
{% endblock %}
