{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/setcwd
bin/tinylog
bin/bash/lite
bin/runsrv/cguard
bin/runsrv/scripts
{% endblock %}
