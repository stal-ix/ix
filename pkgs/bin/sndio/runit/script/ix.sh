{% extends '//etc/services/runit/script/ix.sh' %}

{% block srv_command %}
chown sndiod:sndiod /dev/snd/*
amixer -D {{alsa_device}} sset Master unmute
amixer -D {{alsa_device}} sset Master 100%
exec chrt -f 10 sndiod -dd -f rsnd/{{alsa_device.removeprefix('hw:')}}
{% endblock %}
