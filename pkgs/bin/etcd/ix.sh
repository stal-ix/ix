{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/etcd/ctl
bin/etcd/utl
bin/etcd/server
{% endblock %}
