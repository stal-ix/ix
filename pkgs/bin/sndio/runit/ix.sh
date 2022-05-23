{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/runsrv
bin/sndio/sys
bin/sndio/runit/scripts
{% endblock %}
