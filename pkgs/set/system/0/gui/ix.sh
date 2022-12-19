{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/git
bin/mpv
bin/wget
bin/sway
bin/foot
bin/mako
bin/grim
bin/iwgtk
bin/python
bin/evince
bin/fuzzel
bin/swayimg
bin/telegram
bin/epiphany
bin/xdg/open
bin/fontconfig
bin/alsa/utils
{% endblock %}

{% block run_data %}
set/fonts/default
{% endblock %}
