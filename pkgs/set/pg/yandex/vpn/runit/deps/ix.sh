{% extends '//die/hub.sh' %}

{# Everything the service executes. The runit script records this hub's uid,
   so rebuilding any of these rewrites the run file and pid1 restarts the
   service on the new binaries. #}

{% block run_deps %}
set/pg/yandex/vpn/scripts
bin/openvpn/yandex
bin/openssh/client
bin/ip/route2
bin/python
{% endblock %}
