{% extends '//die/hub.sh' %}

{% block run_deps %}
lib/python/3/10
bld
bin/dash
bin/curl
{% endblock %}
