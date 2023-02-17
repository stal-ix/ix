{% extends '//die/hub.sh' %}

{% block run_deps %}
etc/services/runit(srv_slot=system,srv_name=sndiod,srv_command=chrt -f 10 sndiod -dd -f rsnd/{{alsa_device or 'default'}})
{% endblock %}
