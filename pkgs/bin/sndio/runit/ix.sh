{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/sndio/sys
etc/services/runit(srv_dir=sndiod,srv_command=chrt -f 10 sndiod -dd -f rsnd/{{alsa_device or 'default'}})
{% endblock %}
