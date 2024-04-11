{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/mc
bin/ted
bin/wget
bin/curl
bin/htop
bin/niri
bin/bash
bin/less
set/debug
bin/nebula
bin/waybar
set/pg/shh
bin/iwd/ctl
bin/alacritty
set/stalix/gui
aux/fonts/inter
bin/brightnessctl
{% endblock %}
