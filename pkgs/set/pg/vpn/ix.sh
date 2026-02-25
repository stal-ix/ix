{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/openssh/client
etc/services/runit(srv_deps=bin/openssh/client,srv_dir=vpn_cz,srv_user=pg,srv_command=exec ssh -N -D 192.168.100.64:1080 -o StrictHostKeyChecking=no root@176.74.218.69)
etc/services/runit(srv_deps=bin/openssh/client,srv_dir=vpn_jopa,srv_user=pg,srv_command=exec ssh -N -D 192.168.100.64:1081 -i /home/pg/.ssh/ampere -o StrictHostKeyChecking=no mudak@45.11.171.78)
{% endblock %}
