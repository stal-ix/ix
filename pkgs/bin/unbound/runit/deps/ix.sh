{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/unbound/lite
bin/unbound/runit/conf
{% endblock %}
