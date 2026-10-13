{% extends '//die/hub.sh' %}

{% block run_deps %}
set/pg/arc/runit/deps
set/pg/arc/runit(srv_deps=set/pg/arc/runit/deps,srv_dir=arc_mount,srv_user=pg)
bin/runsrv
{% endblock %}
