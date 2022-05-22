{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/gdb
bin/perf
bin/strace
bin/valgrind
{% endblock %}
