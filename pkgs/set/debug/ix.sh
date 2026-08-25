{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/gdb
bin/htop
bin/iotop
bin/strace
bin/fswatch
bin/valgrind
bin/perf/lite
{% endblock %}
