{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/sndio/d
bin/alsa/mixer
etc/user/audio
etc/user/sndiod
bin/sndio/runit/script(srv_dir=sndiod,alsa_device={{alsa_device or 'default'}})
{% endblock %}
