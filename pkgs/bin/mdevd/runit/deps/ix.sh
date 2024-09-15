{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/mdevd
bin/mdevd/runit/conf
{% endblock %}
