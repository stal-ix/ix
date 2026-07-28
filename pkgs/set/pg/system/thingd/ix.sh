{% extends '//die/hub.sh' %}

{% block run_deps %}
etc/services/runit(srv_deps=bin/thingd,srv_dir=thingd,srv_user=pg,srv_command=exec env HOME=/home/pg XDG_CONFIG_HOME=/home/pg/.config thingd -key /home/pg/.ssh/home.key -shared /home/pg/Shared -state /home/pg/.config/thingd)
{% endblock %}
