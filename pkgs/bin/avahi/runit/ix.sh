{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/avahi
etc/user/avahi
etc/services/runit(srv_dir=avahi,srv_command=chown avahi /var/run/avahi; exec /bin/avahi-daemon --debug)
{% endblock %}
