{% extends '//die/hub.sh' %}

{% block run_deps %}
etc/user/avahi
bin/avahi/daemon
bin/avahi/runit/conf
etc/services/runit(srv_dir=avahi,srv_command=chown avahi /var/run/avahi; exec /bin/avahi-daemon --debug -f /etc/avahi.conf)
{% endblock %}
