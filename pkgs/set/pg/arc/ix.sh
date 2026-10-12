{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/fusermount/sud
set/pg/arc/client
set/pg/arc/scripts
set/pg/arc/runit(srv_deps=set/pg/arc/scripts,srv_dir=arc_mount,srv_user=pg)
bin/runsrv
{% endblock %}
