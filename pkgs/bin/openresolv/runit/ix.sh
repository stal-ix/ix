{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/openresolv
bin/openresolv/runit/scripts
{% endblock %}
