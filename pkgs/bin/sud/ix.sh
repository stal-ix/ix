{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/setcwd
bin/sud/client
bin/sud/server
bin/sud/scripts
etc/services/runit(srv_deps=bin/sud/server,srv_dir=sud,srv_command=exec sud_server -R -F -E -s -g -j -k -m -p 127.0.0.1:1 -P /proc/self/fd/1)
{% endblock %}
