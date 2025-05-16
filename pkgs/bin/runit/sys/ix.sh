{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/runit
bin/runit/sys/bin
bin/runit/sys/etc
{% endblock %}
