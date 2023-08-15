{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/setcwd
bin/sud/client
bin/sud/scripts
bin/sud/server(purec=,libc=,allocator=hardened/malloc)
etc/services/runit(srv_dir=sud,srv_command=exec sud_server -R -F -E -s -g -j -k -m -p 127.0.0.1:1 -P dropbear.pid)
{% endblock %}
