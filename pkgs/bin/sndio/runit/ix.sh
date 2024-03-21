{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/sndio/d
etc/user/audio
etc/user/sndiod
etc/services/runit(srv_version=2,srv_dir=sndiod,srv_command=exec chrt -f 10 sndiod -dd -f rsnd/{{alsa_device or 'default'}})
{% endblock %}
