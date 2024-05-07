{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/amixer
bin/sndio/d
etc/user/audio
etc/user/sndiod
bin/sndio/runit/script(srv_dir=sndiod,alsa_device={{alsa_device or 'default'}})
{% endblock %}
